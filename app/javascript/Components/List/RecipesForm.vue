<template>
    <div>
        <h1>Formulario de Criar Receita</h1>
        <form form enctype="multipart/form-data">
            <table class="card recipe-card-form">
                <div class="form">
                    <tr class="card-content">
                        <td><label class="label"><h3>⠀⠀Name⠀⠀</h3></label></td>
                        <td><input class="input is-info" name="name" type="text" placeholder="Name" v-model="newObject.name"></td>
                    </tr>
                    <br>
                    <br>
                    <tr class="card-content">
                        <td><label class="label"><h3>Description</h3></label></td>
                        <td><input class="input is-info" type="textarea" placeholder="Details" v-model="newObject.description"></td>
                    </tr>
                    <br>
                    <br>
                    <tr class="card-content">
                        <td><label class="label"><h3>Ingredients</h3></label></td>
                        <td><input class="input is-info" type="text" placeholder="Name..." v-model="newObject.newIngredient.name"></td><br>
                        <td><input class="input is-info" type="text" placeholder="Quantity..." v-model="newObject.newIngredient.quantity"></td>
                        <td><input class="input is-info" type="text" placeholder="Unity measure..." v-model="newObject.newIngredient.unity_measure"></td>
                        <td><button class="button is-info add-ingredient" id="button" @click="addNewIngredient()"><i class="fas fa-plus"></i></button><br><br></td>
                    </tr>

                    <ul>
                        <li v-for="ingredient in newObject.ingredientsInput" :key="ingredient.name">{{ingredient.name}}, {{ingredient.quantity}}, {{ingredient.unity_measure}} </li>    
                    </ul>        
                    <div class="footer-form">
                        <button  class="button is-info add-recipe" id="button" @click="submitForm()">Criar Receita!</button><br><br>
                        <button  class="button is-info add-recipe" id="button" @click="showList">Back</button>
                    </div>
                </div>
            </table>
        </form>
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
                },
                inputName: "",
                inputDescription: "",
                inputPicture: null
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
            .then(response => {window.location = '/recipes/' , console.log(response) })
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
        createItem: function() {
           
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

</style>