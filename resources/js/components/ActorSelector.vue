<template>
    <div>
        <h5>Add actor</h5>
        <div class="available-actors-list">
            <table>
                <tr v-for="actor in possibleActors" :key="actor.id" class="actor">
                    <td class="col-md-6">
                        {{ actor.name }}
                    </td>
                    <td class="col-md-3">
                        {{ actor.gender }}
                    </td>
                    <td class="col-md-3">
                        <button class="btn btn-success btn-xs" type="button" @click="selectActor(actor)">
                            Add
                        </button>
                    </td>
                </tr>
            </table>
        </div>
        <create-person @personCreated="personCreated"/>
    </div>
</template>

<script>
import Api from '../api'

import CreatePerson from './CreatePerson.vue'

export default {
    props: {
        selectedActors: {
            default() {
                return []
            }
        }
    },

    data() {
        return {
            actors: []
        }
    },

    computed: {
        possibleActors() {
            return this.actors.filter(a => !this.selectedActors.includes(a))
        }
    },

    created() {
        Api.loadPersons()
            .then(actors => {
                this.actors = actors
            })
    },

    methods: {
        personCreated(actor) {
            this.actors.push(actor)
        },

        selectActor(actor) {
            this.$emit('actorSelected', actor)
        }
    },

    components: {
        CreatePerson
    }
}
</script>
