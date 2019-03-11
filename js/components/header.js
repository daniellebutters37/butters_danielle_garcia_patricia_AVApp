export default {
    template: `
        <header id="mainHeader">
        <div id="logo">
            <img src="images/roku_logo.svg" alt="flashback logo">
        </div>

        <nav id="mainNav">
            <ul>
                <li @click="filter_genre('Action')">Action</li>
                <li @click="filter_genre('Comedy')">Comedy</li>
                <li @click="filter_genre('Crime')">Crime</li>
                <li @click="filter_genre('Drama')">Drama</li>
                <li @click="filter_genre('All')">All</li>
            </ul>
        </nav>

        <nav id="secondNav">
            <ul>
                <li @click="filter_type('Movie')">Movie</li>
                <li @click="filter_type('TV Show')">TV Shows</li>
                <li @click="filter_type('All')">All</li>
            </ul>
        </nav>

        <div id="end">
            <input id="search" v-model="search_text" type="text" placeholder="Search..">

            <div id="profile" @click="(menuOpen = !menuOpen)">
                <img src="images/user_icon.svg" alt="user icon">
            </div>
            
            <ul v-if="menuOpen" id="menuList">
                <li> {{$root.user.user_fname}} </li>
                <li> {{$root.user.user_email}} </li>
                <li @click.prevent="$root.$emit('logout')"> Logout </li>
            </ul>
        </div>

    </header>`,
}