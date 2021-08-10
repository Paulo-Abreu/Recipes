<template>
    <div class="recipe-follow-content">
        <h3 class="title">{{recipe.name}}</h3>
        <p class="likes"><i class="fas fa-thumbs-up"></i> :{{recipe.likes_count}}</p>
        <input type="text" class="input" v-model="comment" placeholder="Comment..."><br>
        <button class="button is-light comment-btn" @click="comment_recipe(recipe.id)"><br><i class="far fa-comment"></i></button>
        <button class="button is-light comment-btn" @click="like_recipe(recipe.id)"><br><i class="far fa-thumbs-up"></i></button>
        <br>
        <br>
        <p>COMENTARIOS:</p>
        <hr>
        <div class="recipe-follow-comment" v-for="comment in recipe.comments" :key="comment.name">
            <p>{{comment.content}}</p>
            <hr>
        </div>
    </div>
</template>
<script>
import axios from 'axios';

export default{
    name: 'RecipeWrapper',
    
    data(){
        return{
            comment:'',
        }
    },
    props: {
        recipe: {
            type: Object
        }
    },
    methods:{
        comment_recipe(id){
            console.log(this.comment)
                axios.post('/api/v1/comments', {recipe_id: id, comment: this.comment})
            .then(response => {console.log(response) })  
        },
        like_recipe(recipe){
             axios.post('/api/v1/likes', {recipe_id: recipe})
            .then(response => {console.log(response) })      
        }
    }
}
</script>


