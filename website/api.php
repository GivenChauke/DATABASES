<?php
include "config.php";
class Clients{
    private $response = null;
    private $request = null;
    public function __construct($json){
        $this->request = json_decode($json, true);
    }

    private function getWineryName($managerID){
        $query = "select WineryName from Winery where ManagerID = ?";
        $connection = Database::instance()->connection;
        $statement = $connection->prepare($query);
        $statement->bind_param("s", $managerID);
        $statement->execute();
        $result = $statement->get_result()->fetch_assoc();
        return $result["WineryName"];
    }
    public function login(){
        $details = $this->request["details"];
        $isManager = $this->request["manager"];
        if($this->emailExists($details["Email"], $isManager)){
            $email = $details["Email"];
            $connection = Database::instance()->connection;
            $query = "";
            if($isManager){
                $query = "select * from Manager where Email = ?;";
            }else{
                $query = "select * from Tourists where Email = ?;";
            }
            $statement = $connection->prepare($query);
            $statement->bind_param("s", $email);
            $statement->execute();
            $result = $statement->get_result()->fetch_assoc();
            if(!password_verify($details["Password"].$result["Salt"], $result["Password"])){
                header("HTTP Status 200");
                $this->response = json_encode(Array(
                    "method" => "login",
                    "status" => "error",
                    "message" => "Incorrect password, please try again.",
                    "timestamp"=> time()
                ));
                return $this->response;
            }else{
                header("HTTP Status 200");
                $this->response = Array(
                    "method" => "login",
                    "status" => "success",
                    "message" => "Access granted.",
                    "timestamp"=> time(),
                    "details"=>Array(
                        "Name"=>$result["Name"],
                        "Surname"=>$result["Surname"],
                        "Email"=>$result["Email"],
                        "Nationality"=>$result["Nationality"]
                ));
                if($isManager){
                    $managerID = $result["ManagerID"];
                    $this->response["details"]["WineryName"] = $this->getWineryName($managerID);
                }
                $this->response = json_encode($this->response);
                return $this->response;
            }

        }else{
            $email = $details["Email"];
            header("HTTP Status 200");
            $this->response = json_encode(Array(
                "method" => "login",
                "status" => "error",
                "message" => "User with email address `$email` does not exist. Maybe try creating a new account.",
                "timestamp"=> time()
            ));
            return $this->response;
        }

    }


    public function generateSalt(){
        $characters = "abcdefghijklmnopqrstuvwxyz1234567890";
        $salt = "";
        for($i = 0; $i<10; $i++){
            $salt .= $characters[rand(0, strlen($characters)-1)];
        }
        return $salt;
    }

    private function emailExists($email, $manager){
        $connection = Database::instance()->connection;
        if($manager){
            $query = "select Email from Manager where Email = ?;";
            $statement = $connection->prepare($query);
            $statement->bind_param("s", $email);
            $statement->execute();
            $result = $statement->get_result();
            if($result->num_rows <= 0){
                return false;
            }else return true;
        }else{
            $query = "select Email from Tourists where Email = ?;";
            $statement = $connection->prepare($query);
            $statement->bind_param("s", $email);
            $statement->execute();
            $result = $statement->get_result();
            if($result->num_rows <= 0){
                return false;
            }else return true;
        }
    }
    private function addWineryManager($wineryName, $managerId){
        $connection = Database::instance()->connection;
        $statement = $connection->prepare("update Winery
                                set ManagerID = ?
                                where WineryName = ?;");
        $statement->bind_param("ss", $managerId, $wineryName);
        $statement->execute();
    }
    private function wineryHasManager($wineryName){
        $connection = Database::instance()->connection;
        $query = "select ManagerID from Winery where WineryName = ?";
        $statement = $connection->prepare($query);
        $statement->bind_param("s", $wineryName);
        $statement->execute();
        $result = $statement->get_result();
        $result = $result->fetch_assoc();
        if($result !== NULL && $result["ManagerID"]===NULL){
            return false;
        }else {
            return true;
        }
    }
    public function signup(){
        $details = $this->request["details"];
        $isManager = $this->request["manager"];
        $connection = Database::instance();

        if($this->emailExists($details["Email"], $isManager)){
            header("HTTP Status 200");
            $email = $details["Email"];
            $this->response = json_encode(Array(
                "method" => "signup",
                "status" => "error",
                "message" => "User with email address `$email` already exists. Please enter a different email address",
                "timestamp"=> time()
            ));
            return $this->response;
        }
        if($isManager && $this->wineryHasManager($details["WineryName"]) ){
            header("HTTP Status 200");
            $this->response = json_encode(Array(
                "method" => "signup",
                "status" => "error",
                "message" => "Sorry, winery already has a manager. Wineries can't have more than 1 manager",
                "timestamp"=> time()
            ));
            return $this->response;
        }
        $salt = $this->generateSalt();
        $query = "";

        if(!$isManager){
            $query = "insert into Tourists (Name, Surname, Nationality, Email, Password, Salt)
                    values (?, ?, ?, ?, ?, ?);";
        }else {
            $query = "insert into Manager (Name, Surname, Nationality, Email, Password, Salt)
                    values (?, ?, ?, ?, ?, ?);";
        }
        $name = $details["Name"];
        $surname = $details["Surname"];
        $nationality = $details["Nationality"];
        $email = $details["Email"];
        $password = $details["Password"];
        $statement = $connection->connection->prepare($query);
        $passwordhash = password_hash($password.$salt, PASSWORD_ARGON2ID, ["cost"=>10]);
        $statement->bind_param("ssssss", $name , $surname, $nationality, $email, $passwordhash , $salt);
        $statement->execute();

        if($isManager){
            $statement = $connection->connection->prepare("select ManagerID from Manager where Email = ?;");
            $statement->bind_param("s", $email);
            $statement->execute();
            $result = $statement->get_result()->fetch_assoc();
            $this->addWineryManager($details["WineryName"], $result["ManagerID"]);
        }
        header("HTTP Status 200");
        $this->response = json_encode(Array(
            "method" => "signup",
            "status" => "success",
            "message" => "User successfully created",
            "timestamp"=> time()
        ));
        return ($this->response);

    }
}


class Winery{
    private $request;
    private $response = null;
    public function __construct($json){
        $this->request = json_decode($json, true);
        $this->validateRequest();
    }
    private function validateRequest(){

        if(!isset($this->request["method"])){
            $this->response = Array(
            "status"=>"error",
            "message"=>"Method parameter missing",
            "timestamp"=>time(),
            );
        }else{
            $method = $this->request["method"];
            if($method === "GetAll");
        }

    }
    public function getResult(){

        if($this->response !== null){
            return json_encode($this->response);
        }
        
        $query = $this->queryBuilder();
        $connection = Database::instance()->connection;
        $result = $connection->query($query);
        $this->response = [
            "method"=> $this->request["method"],
            "status"=>"success",
            "message"=>"Operation successful",
            "timestamp"=>time(),
            "data"=>Array()
        ];
        while($value = $result->fetch_assoc()){
            if(isset($value["ManagerID"]))
                $value["Manager"] = $this->getManagerDetails($value["ManagerID"]);
            array_push($this->response["data"], $value);
        }
        return json_encode($this->response, JSON_UNESCAPED_SLASHES);
    }
    private function getManagerDetails($managerId){
        $connection = Database::instance()->connection;
        $query = "select * from Manager where ManagerID = ?";
        $statement = $connection->prepare($query);
        $statement->bind_param("s", $managerId);
        $statement->execute();
        $result = $statement->get_result();
        $result = $result->fetch_assoc();
        return $result;
    }

    private function queryBuilder(){
        $query = "select * ";
        if($this->request["method"] === "GetWinery"){
            $wineryId = $this->request["WineryID"];
            $query .= "from Wines \n
            where WineID in(select WineID from WineAvailability
            where WineryID = '$wineryId')";
        }
        if($this->request["method"] === "GetAllWineries")
            $query .= "from Winery \n";
        else if ($this->request["method"] === "GetAllWines")
            $query .= "from Wines \n";
        if(isset($this->request["search"])){
            if($this->request["method"] !== "GetWinery") $query .= "where ";
            $counter = 0;
            foreach($this->request["search"] as $key => $value){
                $query.= $key ."='$value'";
                if($counter < sizeof($this->request["search"])-1)
                    $query .= " and ";
                $counter++;
            }
            $query .= "\n";
        }
        if(isset($this->request["sort"])){
            $query .= "order by ".$this->request["sort"];
            if(isset($this->request["order"]))
                $query.= " ".$this->request["order"];
            $query .= "\n";
        }
        $query .= ";";
        return $query;
    }


}

function addRating($request){
    if(isset($request["TouristID"]) && isset($request["WineID"]) && isset($request["Rating"]) && isset($request["RatedWineName"])){
        $connection = Database::instance()->connection;
        $query = "insert into Rating(TouristID, WineID, Rating)
                    values (?, ?, ?);";
        $statement = $connection->prepare($query);
        $statement->bind_param("ssss", $request["TouristID"],  $request["WineID"],  $request["Rating"]);
        $statement->execute();
        return json_encode(Array(
            "method"=>"rating",
            "status"=>"success",
            "message"=>"Rating added"
        ));
    }else{
        return json_encode(Array(
            "method"=>"rating",
            "status"=>"error",
            "message"=>"Post parameters are missing"
        ));
    }
    
}

header("Content-type: application/json");
$user = file_get_contents("php://input");

$client = new Clients($user);
$winer = new Winery($user);
$user = json_decode($user, true);
if(isset($user["method"]) && isset($user["details"]) && isset($user["manager"]) && $user["method"]==="login"){
    echo $client->login();
}else if(isset($user["method"]) && isset($user["details"]) && isset($user["manager"]) && $user["method"]==="signup"){
    echo $client->signup();
}else if(isset($user["method"]) && $user["method"]==="rating"){
    echo addRating($user);
}
else {
    echo ($winer->getResult());
}
?>