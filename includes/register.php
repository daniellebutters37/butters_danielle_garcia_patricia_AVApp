<?php 
	require_once('scripts/config.php');

    if (empty($_POST['fname']) || empty($_POST['username']) || empty($_POST['email']) || empty($_POST['password']) || empty($_POST['user_access'])){
		$message = 'Invalid Input';
		$message = array(
			'error' => true,
			'message' => $message
		);
	} else {
		$username = $_POST['username'];
		$password = $_POST['password'];
		$fname = $_POST['fname'];
		$access = $_POST['user_access'];
		$email = $_POST['email'];
		$message = createUser($fname, $username, $email, $password, $access);
	}

	echo json_encode($message);
?>