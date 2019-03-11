<?php
    session_start();

    function confirm_logged_in(){
        if(isset($_SESSION['user_id'])){
            return  array(
                'success' => true,
                'user' => $_SESSION['user_table']
            );
        } else {
            return  array(
                'error' => true,
                'message' => 'User Not Logged in'
            );
        }
    }

    function last_visit(){
        require_once('connect.php');
        //create timestamp of last login time
        $last_visit = time();
        $last_visit_query = 'UPDATE `tbl_user` SET `last_visit` = :last_visit WHERE `user_id` = '.$_SESSION['user_id'];
        $last_visit_set = $pdo->prepare($last_visit_query);
        $last_visit_set->execute(
            array(
                ':last_visit' => $last_visit
            )
            );
    }

    function logged_out(){
        session_destroy();

        redirect_to('../admin_login.php');
    }

?>