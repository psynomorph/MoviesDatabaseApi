<template>
    <div>
        <h1>{{ movie.title }}</h1>
        <div class="row">
            <div class="col-6">
                <dl>
                    <dt>Type</dt>
                    <dd>{{ movie.type }}</dd>
                    <dt v-if="movie.director && movie.director.id">
                        Director
                    </dt>
                    <dd v-if="movie.director && movie.director.id">
                        {{ movie.director.name }}
                    </dd>
                </dl>
            </div>

            <div class="col-6">
                <h4>Actors</h4>
                <ul>
                    <li v-for="actor in movie.actors" :key="actor.id">
                        {{ actor.name }} ({{ actor.gender }})
                    </li>
                </ul>
                <actor-selector v-show="showActorSelector" :selectedActors="movie.actors" @actorSelected="actorSelected"/>
                <button type="button" class="btn btn-success" v-show="!showActorSelector" @click="showActorSelector = true">
                    Add actor
                </button>
            </div>
        </div>
    </div>
</template>

<script>

import Api from '../api'
import ActorSelector from './ActorSelector.vue'

export default {
    props: ['id'],

    data() {
        return {
            movie: {},
            showActorSelector: false
        }
    },

    mounted()
    {
        this.loadMovie(this.id)
    },

    watch: {
        id(newId) {
            this.loadMovie(newId)
        }
    },

    methods: {
        loadMovie(id) {
            if (id) {
                Api.loadMovie(id)
                    .then(movie => {
                        this.movie = movie
                    })
            }
        },

        actorSelected(actor) {
            this.showActorSelector = false
            Api.addActorToMovieActors(this.movie, actor)
                .then(() => {
                    this.movie.actors.push(actor)
                })
        }
    },

    components: {
        ActorSelector
    }
}
</script>
