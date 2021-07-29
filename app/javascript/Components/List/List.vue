<template>
    <div>
        <div>
            <div class="col-md-12">
                <div class="card-content">
                    <div class="header-content">
                        <div class="media-left">
                            <h3 class="card-title">Receitas de Usuarios Seguidos</h3>
                        </div>
                    </div>
                    <div class="card-body">
                    </div>
                    <div>
                        <div>
                            <div>
                                <div class="card" v-for="recipe in recipes" :key="recipe.name">
                                    <RecipeWrapper :recipe="recipe" />
                                </div>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <div>
            <div class="col-md-12">
                <div class="card-content">
                    <div class="header-content">
                        <div class="media-left">
                            <h3 class="card-title">Minhas receitas</h3>
                        </div>
                    </div>
                    <div class="card-body">
                    </div>
                    <div class="recipes">
                        <div>
                            <div>
                                <div class="card" v-for="recipe in myRecipes" :key="recipe.name">
                                    <br>
                                    <h3 class="title">{{recipe.name}}</h3>
                                    <button class="button is-light comment-btn" @click="editRecipe(recipe.id)">Adicionar Imagem</button>
                                    <br>
                                    <br>
                                </div>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <button  class="button is-info" id="button" @click="createRecipe()">Criar Receita!</button><br><br>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
import RecipeWrapper from './RecipeWrapper.vue';
    export default {
        name: 'List',
        components:{
            RecipeWrapper,
        },
        data(){
            return{
                recipes: [],
                myRecipes: [],
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
            this.recipes = this.data[0]
            this.myRecipes = this.data[1]
            console.log("receitas usuario",this.recipes)
        },
        methods: {
            commentInput(item){
                this.comment = item
                console.log("aaaaaaa", this.comment)
            },
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
.recipes .input{
    width: 1000px;
}
</style>
