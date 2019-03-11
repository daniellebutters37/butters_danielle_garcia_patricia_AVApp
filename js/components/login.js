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
}