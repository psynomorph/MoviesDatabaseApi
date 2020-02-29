<template>
    <div>
        <h6>Create person</h6>

        <form>
            <div class="form-row">
                <div class="col-md-5">
                    <label for="actorName">Name</label>
                    <input type="text" id="actorName" v-model="name" placeholder="Name" class="form-control">
                </div>

                <div class="col-md-4">
                    <label for="actorGender">Gender</label>
                    <select v-model="gender" class="form-control" id="actorGender">
                        <option v-for="gender in genders" :key="gender">
                            {{ gender }}
                        </option>
                    </select>
                </div>

                <div class="col-md-3">
                    <label>&nbsp;</label>
                    <button type="button" class="btn btn-success form-control" @click="addPerson">
                        Add
                    </button>
                </div>
            </div>
        </form>
    </div>
</template>

<script>
import Api from '../api.js'

const genders = ['male', 'female']

export default {
    data() {
        return {
            name: "",
            gender: genders[0],
            genders: genders
        }
    },

    methods: {
        addPerson() {
            Api.addPerson(this.name, this.gender)
                .then(person => {
                    this.name = ""
                    this.$emit('personCreated', person)
                })
        }
    }
}
</script>
