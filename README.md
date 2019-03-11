# Roku Flashback Video Application

![alt text](https://github.com/daniellebutters37/butters_danielle_garcia_patricia_AVApp/images/flashback-logo.png)

**Motivation**<br />
This project is create an video application that is similar to Netflix. Its purpose is to utilize queries to pull information from a database by using vue.js components. It allows for a user API that allows for selecting, filtering and rating video content. Allowing users to register and login to a tailored profile based of video ratings corresponding with age.

**Design**<br />
Illustrator/Photoshop

**Build**
* [Vue.js](https://vuejs.org) - Javascript framework, vue components
* [Sass](https://sass-lang.com) - CSS complier
* AJAX - Front-end technology for handeling data requests

**Getting Started**
Adding Dependencies:
```
   $ Npm init

   $ Npm i -D gulp

   $ npm i -D browser-sync

   $ npm install gulp-cli -g
```
**Installation**
* Node.js
* SASS
* Gulp
* Npm

**Code Example**<br />
Vue example to filter video search:
```js
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
```

**API Reference** 
* fonts.googleapis.com 

**Tests**
* W3C Validator - Valid and semantic HTML tagging
* HTML5 Outline - Valid document outline and proper cascading
* SASS validator - Insure all classes are enclosed and valid

**Credits**
* [Danielle Butters](https://daniellebutters.ca) - Developer
* [Patricia Garcia](https://garcia-patricia.com) - Designer

**License**<br />
MIT