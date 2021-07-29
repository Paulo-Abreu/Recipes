<template>
    <div>
        <h3 class="title">{{recipe.name}}</h3>
        <p class="likes"><i class="fas fa-thumbs-up"></i> :{{recipe.likes}}</p>
        <input type="text" class="input" v-model="comment" placeholder="Comment..."><br>
        <button class="button is-light comment-btn" @click="comment_recipe(recipe.id)"><br><i class="far fa-comment"></i></button>
        <button class="button is-light comment-btn" @click="like_recipe(recipe.id)"><br><i class="far fa-thumbs-up"></i></button>
        <br>
        <br>
        <h5>COMENTARIOS:</h5>
        <hr>
        <div v-for="comment in recipe.comments" :key="comment.name">
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
            .then(response => {window.location = '/', console.log(response) })  
        },
        like_recipe(id){
             axios.post('/api/v1/likes', {recipe_id: id, comment: this.comment})
            .then(response => {window.location = '/', console.log(response) })      
        }
    }
}
</script>
<style scoped>
.input{
    width: 1000px;
}
.title{
    padding-top:20px ;
}
.likes{
    margin: 0 0 15px 1000px;
}
</style>
