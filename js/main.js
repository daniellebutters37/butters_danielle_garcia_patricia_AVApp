import HomeComponent from './components/home.js';
import LoginComponent from './components/login.js';
import RegisterComponent from './components/register.js';

let router = new VueRouter({

  routes: [
      { path: '/', name: 'home', component: HomeComponent },
      { path: '/login', name: 'logn', component: LoginComponent },
      { path: '/register', name: 'register', component: RegisterComponent }
  ]
});

const vm = new Vue({

    data: {
        authenticated: false,
        user: [],
    },

    methods: {
        logout: function(){
            //ternary statement
            let url = `./includes/logout.php`;
            let user = new FormData();
            user.append('logout', true);
            fetch(url, {
                method: 'POST',
                body: user
            })
            .then(res => res.json())
            .then(data => {
                if(data.success != null) {
                    this.authenticated = false;
                    this.$router.push("/login");
                }
            })
            .catch(function(error){
                // console.log(error);
            });
        }
    },

    created: function() {
        this.$root.$on('authenticate', ({ status, user }) => {
            this.authenticated = status;
            this.user = user;
        });
        this.$root.$on('logout', () => {
            this.logout();
        })
    },
    watch: {
        authenticated(){
            if(this.authenticated){
                this.$router.push("/");
            } else {
                this.$router.push("/login" );
            }
        }
    },
    router: router
}).$mount("#app");

// router.beforeEach(({next}) => {
//   if (vm.authenticated == false) {
//     next("/login");
//   } else {
//     next();
//   }
// });