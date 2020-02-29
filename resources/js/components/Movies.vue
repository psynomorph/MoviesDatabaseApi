<template>
    <div class="card-columns">
        <movie-card v-for="movie in movies" :key="movie.id" :movie="movie" class="card"/>
    </div>
</template>

<script>
import Api from '../api'
import MovieCard from './MovieCard.vue'

export default {
    data() {
        return {
            movies: []
        }
    },

    mounted() {
        Api.loadMovies().then(movies => {
            this.movies = movies
        })
    },

    components: {
        MovieCard
    }
}
</script>
