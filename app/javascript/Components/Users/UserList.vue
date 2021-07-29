<template>
    <div>
        <div class="card">
            <div class="row">
                <div class="col-md-12">
                    <div class="card-content">
                        <div class="header-content">
                            <div class="media-left">
                                <h1 class="card-title mt-0">Receitas do Usuario</h1>
                            </div>
                        </div>
                        <div class="card-body">
                        </div>
                        <div>
                            <div class="">
                                <div>
                                    <div class="card recipe-card" v-for="recipe in recipes" :key="recipe.name">
                                        <div>
                                            <h3 >{{recipe.name}}</h3>
                                        </div>
                                    </div>
                                    <br>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: 'Userlist',
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

