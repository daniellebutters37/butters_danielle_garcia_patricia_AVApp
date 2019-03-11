<?php require_once('admin/scripts/config.php');
if(isset($_GET['filter'])){
    $tbl1 = 'tbl_video';
    $tbl2 = 'tbl_genre';
    $tbl3 = 'tbl_video_genre';
    $col1 = 'video_id';
    $col2 = 'genre_id';
    $col3 = 'genre_name';
    $filter = $_GET['filter'];
    $results = filterResults($tbl1, $tbl2, $tbl3, $col1, $col2, $col3, $filter);
}else{
    $results = getAll('tbl_video');
}
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Audio Video App</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" media="screen" href="css/reset.css"/>
	<link rel="stylesheet" type="text/css" media="screen" href="css/main.css"/>
	<link href="https://fonts.googleapis.com/css?family=Muli:200" rel="stylesheet">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body>
    <main id="app" class="wrapper">

	
		
	<section id="movieSelection">
		<div v-for="video in videoData" class="thumbnails">
			<a :href="video.video_url" v-on:click="loadMovie">
				<img class="thumbnail" :src="'images/thumbnails/' +video.video_image" alt="movie poster">
			</a>
			<button v-on:click="fetchSingle" :data-movie="video.video_id" class="watchBtn">Watch</button>
            </div>
	</Section>
	
	<section class="hidden-movies" :class="{'show-movie' : showDetails }">
		<h3 class="movieTitle">{{ videoTitle }}</h3>
		<p class="movieYear">{{ videoYear }}</p>
		<p class="movieRating">{{ videoRating }}</p>
		<p class="movieDuration">{{ videoDuration }}</p>
		<p class="movieDirector">{{ videoDirector }}</p>
		<p class="movieDesc">{{ videoDesc }}</p>

		<video :src="'video/' + videoPath" autoplay></video>
	</section>

	<footer id="mainFooter">

		<div id="socialMedia">
			<ul>	
				<li><a href="https://twitter.com/?lang=en" target="_blank"><img src="images/facebook.svg"></a></li>
				<li><a href="https://www.instagram.com" target="_blank"><img src="images/instagram.svg"></a></li>
				<li><a href="https://www.facebook.com" target="_blank"><img src="images/facebook.svg"></a></li>
			</ul>
		</div>

		<img id="footerLogo" src="images/roku_logo.svg" alt="footer logo">

		<div id="footerMenu">
			<ul>
				<li><a href="#">Audio and Subtitles</a></li>
				<li><a href="#">Media Center</a></li>
				<li><a href="#">Help Center</a></li>
				<li><a href="#">Contact Us</a></li>
			</ul>

			<ul>
				<li><a href="#">Legal Notice</a></li>
				<li><a href="#">Terms of Use</a></li>
				<li><a href="#">Privacy</a></li>
				<li><a href="#">Cookie Preference</a></li>
			</ul>
		</div>

	</footer>	
	
	</main>
</body>
	<script src="js/main.js"></script>
</html>