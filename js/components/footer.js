export default {
    template: `<footer id="mainFooter">

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

    </footer>`,

    data(){
        return {
            search_text: '',
            menuOpen: false,
        }
    },
    methods: {
        filter_genre : function(gen){
            this.$root.$emit('change-filter', gen);
        },
        filter_type : function(gen){
            this.$root.$emit('change-type', gen);
        },
    },
    watch: {
        search_text(){
            this.$root.$emit('search-movie', this.search_text);
        }
    }
}