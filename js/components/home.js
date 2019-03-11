import HeaderC from './header.js';
import FooterC from './footer.js';
import LightBoxC from './light_box.js';

export default {
    template: 
    `<div>
        <Header></Header>
        <section id="movieSelection">
            <div v-for="video in videoData" class="thumbnails">
                <a :href="video.video_url" @click.prevent="openBox(video)">
                    <img class="thumbnail" :src="'images/thumbnails/' +video.video_image" alt="movie poster">
                </a>
                <!-- <button v-on:click="fetchSingle" :data-movie="video.video_id" class="watchBtn">Watch</button> -->
            </div>
        </section>
        <lightBox :open="lightBoxStatus" :videoData="lightBoxDate"></lightBox>
        <Footer></Footer>
    </div>`,

}