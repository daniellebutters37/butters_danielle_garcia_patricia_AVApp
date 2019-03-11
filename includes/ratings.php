<?php
    require_once('./scripts/config.php');
    if(isset($_SESSION['user_id'])){
        require('./scripts/connect.php');
        if(isset($_POST['stars']) && isset($_POST['video_id']) && isset($_SESSION['user_id'])){
            $add_rating_query = 'INSERT INTO `tbl_rating` (`video_id`, `user_id`, `stars`, `time`) VALUES (:video_id, :user_id, :stars, '.time().');';
            $add_rating = $pdo->prepare($add_rating_query); 
            $add_rating->execute(
                array(
                    ':video_id' => $_POST['video_id'],
                    ':user_id' => $_SESSION['user_id'],
                    ':stars' => $_POST['stars']
                )
            );

            if($add_rating->rowCount() > 0){
                echo json_encode(array(
                    'success' => 'rated successfully'
                ));
            } else {
                echo json_encode(array(
                    'error' => ""
                ));
            }
        } else if(isset($_POST['delete_id']) && isset($_SESSION['user_id'])){
            $delete_rating_query = 'DELETE FROM `tbl_rating` WHERE `rating_id` = :rating_id AND `user_id` = :user_id';
            $delete_rating = $pdo->prepare($delete_rating_query); 
            $delete_rating->execute(
                array(
                    ':rating_id' => $_POST['delete_id'],
                    ':user_id' => $_SESSION['user_id']
                )
            );

            if($delete_rating->rowCount() > 0){
                echo json_encode(array(
                    'success' => 'Rating deleted'
                ));
            } else {
                echo json_encode(array(
                    'error' => 'Unable to Delete Rating'
                ));
            }
        } else if(isset($_POST['video_id'])) {
            $ratings_query = "SELECT * FROM `tbl_rating` WHERE `video_id` = :video";
            $ratings = $pdo->prepare($ratings_query);            
            $ratings->execute(
                array(
                    ':video' => $_POST['video_id']
                )
            );
            $rating_array = array();
            while($rows = $ratings->fetch(PDO::FETCH_ASSOC)){
                $user_query = "SELECT * FROM `tbl_user` WHERE `user_id` = :user_id";
                $user = $pdo->prepare($user_query);            
                $user->execute(
                    array(
                        ':user_id' => $rows['user_id']
                    )
                );
                $user = $user->fetch(PDO::FETCH_ASSOC);
                $rows['user_name'] = $user['user_name'];
                $rows['delete_button'] = ($rows['user_id'] == $_SESSION['user_id']);
                $rating_array[] = $rows;
            }
            echo json_encode(array(
                'success' => "",
                'ratings' => $rating_array
            ));
        } else {
            echo json_encode(array(
                'error' => "Unknown request"
            ));
        }
        
    } else {
        echo json_encode(array(
            'error' => "Unauthorized, Login Require !"
        ));
    }
?>