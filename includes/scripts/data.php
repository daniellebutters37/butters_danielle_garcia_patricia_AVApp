<?php

function get_one_video($user, $pdo, $vid) {
    require('connect.php');
    $query = "SELECT * FROM tbl_video WHERE `video_id` = '$vid' AND `video_age_rating` <= ".$user['user_access'];

    $get_video = $pdo->query($query);
    $results = array();

    while($row = $get_video->fetch(PDO::FETCH_ASSOC)) {
        $results[] = $row;
    }

    return $results;
}

//get all videos

function get_all_videos($user, $pdo) {
    require('connect.php');
    $query = "SELECT * FROM tbl_video WHERE `video_age_rating` <= ".$user['user_access'];

    $get_video = $pdo->query($query);
    $results = array();

    while($row = $get_video->fetch(PDO::FETCH_ASSOC)) {
        $gen_query = "SELECT (SELECT `tbl_genre`.`genre_name` FROM `tbl_genre` WHERE `tbl_genre`.`genre_id` = `tbl_video_genre`.`genre_id`) as 'video_gen' FROM `tbl_video_genre` WHERE `video_id` = ".$row['video_id'];
        $get_gen_names = $pdo->query($gen_query);
        $gen_names = ['All'];
    
        while($gen_row = $get_gen_names->fetch(PDO::FETCH_ASSOC)) {
            $gen_names[] = $gen_row['video_gen'];
        }
        $row['video_genre'] = $gen_names;
        $results[] = $row;
    }

    return $results;
}

?>