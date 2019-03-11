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
    </section>`,}