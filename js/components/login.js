import FooterC from './footer.js';

export default {
    template: 
    `<div>
        <img id="logoLogin" src="images/roku_logo.svg" alt="flashback logo">
        
        <div id="form">
            <div id="cta">
                <p>LOGIN<br>TO YOUR<br>ACCOUNT</p>
                <span id="response">{{errorMessage}}</span>
            <?php endif;?>
            </div>
        
            <form v-on:submit.prevent="loginUser">
                <label id="usernameLogin">USERNAME
                    <input v-model="username" type="text" name="username">
                </label>
                <br>
                <label id="passwordLogin">PASSWORD
                    <input v-model="password" type="password" name="password">
                </label>
                <br>
                <button id="loginBtn" type="submit">LOGIN</button>
                <br>
                <p class="loginCreate">Don't have an account : <a href="#/register">Register Here</a></p>
            </form>
        </div>
        <Footer></Footer>
    </div>`,
    
    data() {
        return {
            errorMessage : '',
            username: '',
            password: '',
        }
    },
    methods: {
        loginUser: function(){
            //ternary statement
            let url = `./includes/login_call.php`;
            let user = new FormData();
            user.append('username', this.username);
            user.append('password', this.password);

            fetch(url, {
                method: 'POST',
                body: user
            })
            .then(res => res.json())
            .then(data => {
                if(data.success != null) {
                    this.$root.$emit('authenticate', { status: true, user: data.user });
                } else {
                    this.errorMessage = data.message;
                }
            })
            .catch(function(error){
                // console.log(error);
            });
        }
    },
    created() {
        if(this.$root.authenticated){
            this.$router.push("/");
        }
    },
    components: { Footer : FooterC }
}