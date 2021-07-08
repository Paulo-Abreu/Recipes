<template>
    <div>
        <table  class="card" id="create_form">
            <tr class="card-content">
                <th class="card-title" id="title" colspan="2">Formulario de Criar Receita</th>
            </tr>

            <tr class="card-content">
                <td><label class="label">Name</label></td>
                <td><input class="input is-info" name="name" type="text" placeholder="Name" v-model="newObject.name"></td>
            </tr>

            <tr class="card-content">
                <td><label class="label">Description</label></td>
                <td><input class="input is-info" type="textarea" placeholder="Details" v-model="newObject.description"></td>
            </tr>

            <tr class="card-content">
                <td><label class="label">Ingredients</label></td>
                <td><input class="input is-info" type="text" v-model="newObject.newIngredient.name"></td>
                <td><input class="input is-info" type="text" v-model="newObject.newIngredient.quantity"></td>
                <td><input class="input is-info" type="text" v-model="newObject.newIngredient.unity_measure"></td>
                <button class="button is-info" id="button" @click="addNewIngredient()"><i class="fas fa-plus"></i></button><br><br>
            </tr>

            <ul>
                <li v-for="ingredient in newObject.ingredientsInput" :key="ingredient.name">{{ingredient.name}}, {{ingredient.quantity}}, {{ingredient.unity_measure}} </li>    
            </ul>        

            <button  class="button is-info" id="button" @click="submitForm()">Criar Receita!</button><br><br>
            <button  class="button is-info" id="button" @click="showList">Back</button>
        </table><br>
    </div>

</template>
<script>
import axios from 'axios';
export default{ 
    name: 'CreateRecipe',
    data(){
        return{
            newObject: {
                name: '',
                description: '',
                ingredientsInput:[],
                newIngredient:{
                    name:'',
                    quantity:'',
                    unity_measure:''
                }
            }
        }
    },
    props: {
        data: {
            type: Array
        }
    },
    methods: {
        submitForm (event) {
            axios.post('/api/v1/recipes', {recipe: this.newObject})
            .then(response => {window.location = '/', console.log(response) })
        },
        showList () {
            window.location = '/'
        },
        addNewIngredient () {
            if (this.newObject.newIngredient.name == '' ||this.newObject.newIngredient.quantity == '' || this.newObject.newIngredient.unity_measure == '') {
                alert("NAO É POSSIVEL CRIAR INGREDIENTE VAZIO") 
            } else {
                let ingredient = {
                        name: this.newObject.newIngredient.name,
                        quantity: this.newObject.newIngredient.quantity,
                        unity_measure: this.newObject.newIngredient.unity_measure
                }
                this.newObject.ingredientsInput.push(ingredient)
            }
        },
    },
    computed: {
        loadIngredient(){
            return this.igredientsInput
        }
    }
}
</script>

<style>
.content table{
    width: 800px;
}
#title{
    background: rgb(13, 0, 255);
    color: white;
}
.card{
    margin: auto;
    margin-top: 100px;
}
</style>