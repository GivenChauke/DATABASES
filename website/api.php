<?php
include "config.php";
// echo "Your mum am fat";
// $connection = Database::instance();
// $result = $connection->connection->query("select * from Wines
//                                             limit 100;");

$response = Array(
    "status" => "success",
    "message" => "Operation was successful",
    "method" => "GetAllWineries",
    "timestamp" => time(),
    "data" => Array()
);

$request = Array(
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



while ($tuple = $result->fetch_assoc()){
    array_push($response["data"], $tuple);
}

//print_r ($response);


class Clients{



    private $response = null;
    public function __construct(){
        echo "<br>Client object created and shit <br>";
    }

    public function login($details, $manager){
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
                return json_encode(Array(
                    "method" => "login",
                    "status" => "error",
                    "message" => "Incorrect password, please try again.",
                    "timestamp"=> time()
                ));
            }else{
                header("HTTP Status 200");
                return json_encode(Array(
                    "method" => "login",
                    "status" => "success",
                    "message" => "Access granted.",
                    "timestamp"=> time()
                ));
            }

        }else{
            $email = $details["Email"];
            header("HTTP Status 200");
            return json_encode(Array(
                "method" => "login",
                "status" => "error",
                "message" => "User with email address `$email` does not exist. Maybe try creating a new account.",
                "timestamp"=> time()
            ));
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
    public function signup($details, $manager){
        $connection = Database::instance();
        if($this->emailExists($details["Email"], $manager)){
            header("HTTP Status 200");
            $email = $details["Email"];
            return json_encode(Array(
                "method" => "signup",
                "status" => "error",
                "message" => "User with email address `$email` already exists. Please enter a different email address",
                "timestamp"=> time()
            ));
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
        $this->response = Array(
            "method" => "signup",
            "status" => "success",
            "message" => "User successfully created",
            "timestamp"=> time()
        );
        return json_encode($this->response);

    }
}

class Winery{
    private $clients;
    public function __construct($json){


    }
}




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

$client = new Clients();

echo $client->signup($user["details"], $user["manager"]);
echo "<br><br>";
echo $client->login($tourist["details"], $tourist["manager"]);

?>