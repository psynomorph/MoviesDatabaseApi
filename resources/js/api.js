/**
 * Methods for interacting with JSON API
 */

const axios = require('axios').default
const moviesResourceUrl = '/movies'
const personsResourceUrl = '/persons'
const actorsSubResourceKey = 'actors'
const token = "ilkfsjlkasjflk10942jadskncl"

axios.defaults.headers.common['Authorization'] = 'Bearer ' + token

export default {
    loadMovies() {
        return axios.get(moviesResourceUrl)
            .then(r => r.data)
    },

    loadPersons() {
        return axios.get(personsResourceUrl)
            .then(r => r.data)
    },

    loadMovie(id) {
        var url = [moviesResourceUrl, id].join('/')
        return axios.get(url)
            .then(r => r.data)
    },

    addPerson(name, gender) {
        const data = { name, gender }
        return axios.post(personsResourceUrl, data)
            .then(r => r.data)
    },

    addActorToMovieActors(movie, actor) {
        var url = [moviesResourceUrl, movie.id, actorsSubResourceKey, actor.id].join('/')
        return axios.put(url)
    }
}
