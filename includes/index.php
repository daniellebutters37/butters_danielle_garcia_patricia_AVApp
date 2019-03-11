<?php
require_once('scripts/config.php');
//single movie route
$login = confirm_logged_in();
if($login['success']){
    if(isset($_GET['movie'])) {
        $data = get_one_video($login['user'], $conn, $_GET['movie']);
        echo json_encode($data);
    } else{

    //all movies route
        $data = get_all_videos($login['user'], $conn);
        echo json_encode($data);
    }
} else {
    $message = 'No users logged in';
    echo json_encode(array(
        'error' => true,
        'message' => $message
    ));
}
?>