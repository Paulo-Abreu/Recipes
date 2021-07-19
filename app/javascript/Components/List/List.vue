<template>
    <div>
        <div class="row">
            <div class="col-md-12">
                <div class="card-content">
                    <div class="header-content">
                        <div class="media-left">
                            <h1 class="card-title mt-0">Receitas Usuarios Seguidos</h1>
                        </div>
                    </div>
                    <div class="card-body">
                    </div>
                    <div>
                        <div>
                            <div>
                                <div class="card" v-for="recipe in recipes" :key="recipe.name">
                                    <h3>{{recipe.name}}</h3>
                                    <h3>Receita do User:{{recipe.user_id}}</h3>
                                    <button class="button is-light comment-btn" @click="comment_recipe(recipe.id)"><i class="far fa-comment"></i></button>
                                    <input type="text" class="input" v-model="comment" placeholder="Comment...">
                                    <div class="card" v-for="comment in comments" :key="comment.name">
                                        <p>{{comment.content}}</p>
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
</template>

<script>
import axios from 'axios';
    export default {
        name: 'List',
        data(){
            return{
                recipes: [],
                comments: [],
                comment:''
            }
        },
        props: {
            data: {
                type: Array
            }
        },
        mounted() {
            console.log("receitas usuario",this.data)
            this.recipes = this.data
            this.comments = this.recipes.comments 
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
            comment_recipe(id){
                console.log(this.comment)
                  axios.post('/api/v1/comments', {recipe_id: id, comment: this.comment})
                .then(response => {window.location = '/', console.log(response) })  
            }
        },
    }
</script>
<style>
.card-content{
    text-align: center;
    margin-left: 500px;
}
</style>
