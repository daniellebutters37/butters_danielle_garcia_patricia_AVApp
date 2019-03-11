import FooterC from './footer.js';

export default {
    template: 
    `<div>
        <img id="logoLogin" src="images/roku_logo.svg" alt="flashback logo">
        <div id="form">
            <div id="cta">
                <p>CREATE<br>USER</p>
                <span id="response">{{errorMessage}}</span>
            </div>
    
            <form v-on:submit.prevent="registerUser">
                <label for="first-name" id="firstName">FIRST NAME
                    <input v-model="fname" type="text" id="first-name" name="fname" value=""><br><br>
                </label>
    
                <label for="username" id="username">USERNAME
                    <input v-model="username" type="text" id="username" name="username" value=""><br><br>
                </label>
    
                <label for="email" id="email">EMAIL
                    <input v-model="email" type="email" id="email" name="email" value=""><br><br>
                </label>
    
                <label for="password" id="email">PASSWORD
                    <input v-model="password" type="password" id="password" name="password" value=""><br><br>
                </label>

                <label for="im" id="age">AGE :
                    <select v-model="userAccess" id="age" name="im">
                        <option value="3" selected>Over 18</option>
                        <option value="2">Under 18</option>
                        <option value="1">Under 13</option>
                    </select>
                </label>
                <br/>
                <button type="submit" name="submit" id="createBtn">Create User</button>
                <br/>
                <p class="loginCreate" >Already have an account : <a href="#/login">Login Here</a></p>

            </form>
        </div>
        <Footer></Footer>
    </div>`,
}