<?php 
	require_once('scripts/config.php');

	if (isset($_POST['logout'])) {
		unset($_SESSION);
		session_destroy();
		if(isset($_SESSION['user_table'])){
			$message =  array(
				'error' => true,
				'message' => 'Logout Failed'
			);
		} else {
			$message =  array(
				'success' => true,
				'message' => 'Logout Successful'
			);
		}
	}

	echo json_encode($message);
?>