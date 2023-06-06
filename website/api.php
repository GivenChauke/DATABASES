<?php
include "config.php";
class Clients{
    private $response = null;
    private $request = null;
    public function __construct($json){
        $this->request = json_decode($json, true);
    }

    public function login(){
        $details = $this->request["details"];
        $manager = $this->request["manager"];
        if($this->emailExists($details["Email"], $manager)){
            $email = $details["Email"];
            $connection = Database::instance()->connection;
            $query = "";
            if($manager){
                $query = "select Password, Salt from Manager where Email = ?;";
            }else{
                $query = "select Password, Salt from Tourists where Email = ?;";
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
                $this->response = json_encode(Array(
                    "method" => "login",
                    "status" => "success",
                    "message" => "Access granted.",
                    "timestamp"=> time()
                ));
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
    public function signup(){
        $details = $this->request["details"];
        $manager = $this->request["manager"];
        $connection = Database::instance();
        if($this->emailExists($details["Email"], $manager)){
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
            $salt = $this->generateSalt();
            $query = "";

            if(!$manager){
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
    private $response;
    private $sortArray = ["AverageRating", "WineName", "Price", "AlcoholPercentage", "Year", "Type", "Region", "Varietal"];
    private $searchArray = ["AverageRating", "WineName", "Price", "AlcoholPercentage", "Year", "Type", "Region", "Varietal"];
    public function __construct($json){
        $this->request = json_decode($json);
        $this->validateRequest();
    }
    private function validateRequest(){

    }
    public function getResult(){
        $query = $this->queryBuilder();
        $connection = Database::instance()->connection;
        $result = $connection->query($query);
        $this->response = [
            "method"=> $this->request["method"],
            "status"=>"success",
            "timestamp"=>time(),
            "data"=>Array()
        ];
        while($value = $result->fetch_assoc()){
            array_push($this->response["data"], $value);
        }
        return json_encode($this->response, JSON_UNESCAPED_SLASHES);
    }
    private function getAllWineries(){


    }
    private function getAllWines(){

    }

    private function queryBuilder(){
        $query = "select * ";
        if($this->request["method"] === "GetAllWineries")
            $query .= "from Winery \n";
        else if ($this->request["method"] === "GetAllWines")
            $query .= "from Wines \n";
        if(isset($this->request["search"])){
            $query .= "where ";
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
$winey = Array(
    "method"=>"GetAllWineries",
    "sort" => ["WineryName", "StreetName", "City", "Province"],
    "order" => "ASC",
    "search"=>Array(
        "WineryName" => "Winey",
        "StreetName"=>"Yes",
        "City" => "CityNam",
        "Province"=>"proovin"
    )
);
$wines = Array(
    "method" => "GetAllWines",
    "sort"=> "Price",
    "order"=> "ASC",
    "search"=>Array(
        "Region"=>"What everrr refuuu",
        "Country"
    )
);


$user = Array(
    "method" => "signup",
    "details" => Array(
        "Name" => "Given",
        "Surname"=>"Chauke",
        "Nationality"=>"South Africa",
        "Email" => "mrsleepyhead@gmail.com",
        "Password" => "3rdStrongP@ssword"
    ),
    "manager" => true
);

$tourist = Array(
    "method" => "login",
    "details" => Array(
        "Email" => "mrfrontend@gmail.com",
        "Password" => "2ndStrongP@ssword"
    ),
    "manager" => false
);

header("Content-type: application/json");
$user = file_get_contents("php://input");

$client = new Clients($user);
$winer = new Winery($user);
$user = json_decode($user, true);
if(isset($user["method"]) && isset($user["details"]) && isset($user["manager"]) && $user["method"]==="login"){
    echo $client->login();
}else if(isset($user["method"]) && isset($user["details"]) && isset($user["manager"]) && $user["method"]==="signup"){
    echo $client->signup();
}else {
    echo ($winer->getResult());
}
//echo $client->signup($user["details"], $user["manager"]);
//echo "<br><br>";
//echo $client->login($tourist["details"], $tourist["manager"]);

?>