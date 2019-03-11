export default {
    template: `
    <section class="show-movie" v-if="open">
        <div class="info">
            <h3 class="movieTitle">{{ videoData.video_title }}</h3>
            <p class="movieYear">{{ videoData.video_year }}</p>
            <p class="movieRating">{{ videoData.video_rating }}<i class="fa fa-star"></i></p>
            <p class="movieDuration">{{ videoData.video_duration }}</p>
            <p class="movieDirector">{{ videoData.video_director }}</p>
            <p class="movieDesc">{{ videoData.video_desc }}</p>

            <video :src="'video/' + videoData.video_url" austoplay controls></video>
    
            <div>
                <h3>Rate the Video</h3>
                <select v-model="rateNew">
                    <option v-for="i in [1,2,3,4,5]" :value="i">
                        <p v-for="s in i">*</p>
                    </option>
                </select>
                <button class="addBtn" @click="addRating">Add</button>
            </div><br>
            <p>What Other Users Thought:</p>
            <ul>
                <li v-for="(rating, key) in ratings">
                    <span>{{rating.user_name}}</span>
                    <i v-for="i in parseInt(rating.stars)" class="fa fa-star"></i>
                    <button class="ratingDeleteBtn" @click="() => deleteRating(rating.rating_id)" v-if="rating.delete_button"><i class="fa fa-times"></i></button>
                </li>
            </ul>

        </div>
        <button class="closeButton" @click="lighBoxClose"><i class="fa fa-times"></i></button>
    </section>`,

    props: ['open', 'videoData'],
    data(){
        return {
            ratings : [],
            rateNew : ''
        }
    },
    methods: {
        lighBoxClose: function(){
            this.$parent.lightBoxStatus = false;
        },
        fetchRatings(){
            let url = `./includes/ratings.php`;
            let request = new FormData();
            request.append('video_id', this.videoData.video_id);
            fetch(url, {
                method: 'POST',
                body: request
            })
            .then(res => res.json())
            .then(data => {
                if(data.ratings != null) {
                    this.ratings = data.ratings;
                }
            })
            .catch(function(error){
                // console.log(error);
            });
        },
        addRating(){
            let url = `./includes/ratings.php`;
            let request = new FormData();
            request.append('video_id', this.videoData.video_id);
            request.append('stars', this.rateNew);
            console.log([this.videoData.video_id, this.rateNew])
            fetch(url, {
                method: 'POST',
                body: request
            })
            .then(res => res.json())
            .then(data => {
                if(data.success != null) {
                    this.rateNew = 1;
                    this.fetchRatings();
                }
            })
            .catch(function(error){
                // console.log(error);
            });
        },
        deleteRating(id){
            let url = `./includes/ratings.php`;
            let request = new FormData();
            request.append('delete_id', id);
            fetch(url, {
                method: 'POST',
                body: request
            })
            .then(res => res.json())
            .then(data => {
                if(data.success != null) {
                    this.fetchRatings();
                }
            })
            .catch(function(error){
                // console.log(error);
            });
        }

    },
    watch: {
        videoData(){
            this.fetchRatings();
        }
    }
}