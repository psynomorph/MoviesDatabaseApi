const VueRouter = require('vue-router').default

/**
 * App routes
 */
const routes = [
    { path: '/', component: require('./components/Movies.vue').default }, // List of movies route
    { // Single movie page route
        path: '/movie/:id',
        component: require('./components/Movie.vue').default,
        props: true,
        name: 'movie'
    }
]

/**
 * Create new Vue router
 */
export default new VueRouter({
    routes
})
