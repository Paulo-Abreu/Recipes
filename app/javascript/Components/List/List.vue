<template>
    <div>
        <div class="card">
            <div class="row">
                <div class="col-md-12">
                    <div class="card-content">
                        <div class="header-content">
                            <div class="media-left">
                                <h4 class="card-title mt-0">Receitas</h4>
                            </div>
                            <div>
                                <button class="button is-primary" @click="createRecipe()">Nova Receita</button>
                            </div>
                        </div>
                        <div class="card-body">
                        </div>
                        <div>
                            <table class="table is-striped">
                                <tbody>
                                    <tr v-for="recipe in recipes" :key="recipe.name">
                                        <td>{{recipe.name}}</td>
                                        <td><button class="button is-danger">Deletes</button></td>
                                        <td><button class="button is-link">Edit</button></td>
                                    </tr>
                                    <br>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <button class="button is-success" @click="goToTimeline">Timeline</button>
        </div>
    </div>
</template>

<script>
    export default {
        name: 'List',
        data(){
            return{
                recipes: [],
            }
        },
        props: {
            data: {
                type: Array
            }
        },
        mounted() {
            console.log("aqui",this.data)
            this.recipes = this.data
        },
        methods: {
            createRecipe: function (event) {
                window.location = '/recipes/new'
            },
            editRecipe: function (id) {
                window.location = '/recipes/' + id + '/edit'
            },
            goToTimeline () {
                window.location = '/timeline' 
            },
        },
    }
</script>
<style>
.card-content{
    text-align: center;
    margin-left: 500px;
}
</style>
