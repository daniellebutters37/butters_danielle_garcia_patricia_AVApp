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

    data() {
        return {
            allVideoData: [],
            typedVideoData: [],
            videoData: [],
            lightBoxStatus: false,
            lightBoxDate: {}
        }
    },
    methods: {
        fetchMovieData: function(){
            //ternary statement
            let url = `./includes/index.php`;

            fetch(url)
            .then(res => res.json())
            .then(data => {
                this.videoData = 
                this.typedVideoData = 
                this.allVideoData = data;
                if(data.error != null) {
                    this.$root.$emit('authenticate', { status: false, user: {} });
                    this.$router.push("/login");
                } else {
                    let url = `./includes/login_call.php`;
                    let user = new FormData();
                    user.append('check_login', true);
                    fetch(url, {
                        method: 'POST',
                        body: user
                    })
                    .then(res => res.json())
                    .then(data => {
                        if(data.success != null){
                            this.$root.$emit('authenticate', { status: true, user: data.user});
                        } else {
                            this.$root.$emit('authenticate', { status: false, user: {} });
                        }
                    })
                }
            })
            .catch(function(error){
                // console.log(error);
            });
        },
        openBox: function(video){
            this.lightBoxStatus = true;
            this.lightBoxDate = video;
        },
    },
    mounted(){
        this.fetchMovieData();
    },
    created(){
        this.$root.$on('search-movie', (text) => {
            this.videoData = this.typedVideoData.slice(0).filter(({video_title}) => video_title.toLowerCase().includes(text.toLowerCase()));
        });
        this.$root.$on('change-filter', (genre) => {
            if(genre == 'All'){
                this.videoData = this.typedVideoData.slice(0);
            } else {
                this.videoData = this.typedVideoData.slice(0).filter(({video_genre}) => video_genre.includes(genre));
            }
        });
        this.$root.$on('change-type', (type) => {
            if(type == 'All'){
                this.typedVideoData = this.allVideoData.slice(0);
            } else {
                this.typedVideoData = this.allVideoData.slice(0).filter(({video_type}) => video_type.includes(type));
            }
        });
    },
    watch: {
        typedVideoData() {
            this.videoData = this.typedVideoData.slice(0);
        }
    },
    components: {Header : HeaderC, Footer : FooterC, lightBox : LightBoxC}

}