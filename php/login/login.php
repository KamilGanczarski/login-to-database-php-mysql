<?php

require_once '../fetch_data/fetch.php';
$Fetch = new Fetch;
$users = $Fetch->fetch('SELECT * FROM Users');

class Login {
  public $userId = 0;
  public $username = '';
  private $password = '';
  private $loggedBool = '';
  private $users = [];

  public function __construct() {
    global $users;
    $this->users = $users;
  }

  private function checkIfUserExist() {
    for($i=0; $i<count($this->users); $i++) {
      if($this->users[$i]['username'] === $this->username) {
        $this->userId = $i;
        return $this->users[$i]['username'];
      }
    }
  }

  private function checkPassword() {
    if($this->users[$this->userId]['password'] === $this->password) {
      return true;
    } else {
      return false;
    }
  }

  public function checkUser() {
    $this->username = $_POST['username'];
    $this->password = $_POST['password'];
    $this->loggedBool = $this->checkIfUserExist();

    if(!is_null($this->loggedBool)) {
      $this->loggedBool = $this->checkPassword();
      if($this->loggedBool) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}

$Login = new Login;
$Login->checkUser();

if($Login->checkUser()) {
  session_start();
  $_SESSION['login'] = $Login->username;
  $_SESSION['userId'] = $Login->userId;
  header('Location: ../../index.php');
} else {
  session_start();
  $_SESSION['msg'] = 'Incorrect username or password.';
  header('Location: ../../login.php');
}
