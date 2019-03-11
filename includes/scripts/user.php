<?php
    function createUser($fname, $username, $email, $pass, $access) {
        include('connect.php');

        //TODO: the following query will create a new row in tbl_user table 
        //with user_fname = $fname
        //user_name = $username
        //user_pass = $password
        //user_email = $email

        //TODO: redirect user to index.php if success
        //otherwise return a message

        $check_user_exist_query = 'SELECT COUNT(*) FROM tbl_user WHERE user_name = :username';
        $check_user_exist = $pdo->prepare($check_user_exist_query);
        $check_user_exist->execute(
            array(
                ':username' => $username
            )
        );

        if(($check_user_exist->fetchColumn())>0){
            $message = 'User already exist!';
            return  array(
                'error' => true,
                'message' => $message
            );
        }

        $create_user_query = 'INSERT INTO `tbl_user` (`user_fname`, `user_name`, `user_pass`, `user_email`, `user_access`, `user_admin`, `last_visit`, `user_ip`, `account_lockout`) VALUES (:user_fname, :user_name, :user_pass, :user_email, :user_access, 1, '.time().', "'.$_SERVER['REMOTE_ADDR'].'", 0)';
        $create_user_set = $pdo->prepare($create_user_query);
        $create_user_set->execute(
            array(
                ':user_fname' => $fname,
                ':user_name' => $username,
                ':user_pass' => md5($pass),
                ':user_email' => $email,
                ':user_access' => ((int)$access)
            )
        );
        // check password (not encrypted) test to make sure its the correct password by logging in again
        // echo($password); die();

        //send email of un-encrypted password
        if($create_user_set->rowCount() > 0){

            $homepage = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off' ? 'https' : 'http')."://".$_SERVER['SERVER_NAME'];

            $headers = "From: donotreply@movie.com";
            $emailSubject = "Movie Account Setup";
            $emailBody = "Thanks for setting up your new account!".
            "\nUsername Created: $username. Temporary Password: $password. Click Here to Login Now: $homepage";
        
            // mail($headers, $email_subject, $emailBody);
            $message = "User created sucessfully!";
            return  array(
                'success' => true,
                'message' => $message
            );

        } else {
            $message = 'Registration failed !';
            return  array(
                'error' => true,
                'message' => $message
            );
        }
    }

?>