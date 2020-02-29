<template>
    <div class="card-body">
        <div class="card-title">
            <h4>
                <router-link :to="{ name: 'movie', params: { id: movie.id }}">{{ movie.title }}</router-link> - {{ movie.type }} - {{ movie.rating }}
            </h4>
        </div>

        <div class="row">
            <div class="col-md-6">
                <template v-if="Object.keys(movie.director).length > 0">
                    Director: {{ movie.director.name }}
                </template>
            </div>
            <div class="col-md-6">
                <h5>Actors</h5>
                <ul>
                    <li v-for="actor in movie.actors" :key="actor.id">
                        {{ actor.name }}
                    </li>
                </ul>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: ['movie']
}
</script>
