<?php
class Database{
    public $connection = null;
    public static function instance(){
        static $database = null;
        if($database === null){
            $database = new Database();
        }
        return $database;
    }

    private function __construct(){
        $this->connection = new mysqli("wheatley.cs.up.ac.za","u22747886","UXQJ6LBF7PPDLD2KEQEP6WWHGBLPJZ7Y");
        if($this->connection->error){
            die("Error lol".$this->connection->error);
        }
        try{$this->connection->select_db("u22747886_WINE");}
        catch (mysqli_sql_exception $e){
            echo $e;
        }
    }

    public function __destruct(){
        $this->connection->close();
    }
}



?>