<?php 
	require_once('scripts/config.php');

	if (isset($_POST['check_login'])) {
		$message = confirm_logged_in();
	} else if (empty($_POST['username']) || empty($_POST['password'])){
		$message = 'No Username or Password';
		$message = array(
			'error' => true,
			'message' => $message
		);
	} else {
		$username = $_POST['username'];
		$password = $_POST['password'];
		$ip = $_SERVER['REMOTE_ADDR'];
		$message = login($username, $password, $ip);
	}

	echo json_encode($message);
?>