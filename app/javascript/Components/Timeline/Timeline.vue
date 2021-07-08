<template>
    <div class="container">
        <div class="timeline">
            <ul>
                <li v-for="recipe in allRecipes" :key="recipe.name" >
                    <div class="timeline-content">
                        <h3 class="date">{{recipe.created_at}}</h3>
                        <h1>{{recipe.name}}</h1>
                        <p>{{recipe.description}}</p>
                    </div>
                </li>
            </ul>    
        </div>
    </div>
</template> 

<script>

export default {
    name:'Timeline',

     data(){
        return{
            allRecipes:[]
        }
    },
     props: {
            data: {
                type: Array
            }
    },
    mounted(){
        console.log("data", this.data)
        this.allRecipes = this.data
    }
}
</script>
<style >
.timeline-content{
    margin-top: 10px;
}
</style>