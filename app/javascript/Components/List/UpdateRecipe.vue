<template>
    <div>
        <form form enctype="multipart/form-data">
            <table  class="card" id="create_form">
                <tr class="card-content">
                    <th class="card-title" id="title" colspan="2">Adicionar Imagem</th>
                </tr>
                <tr class="card-content image">
                    <td><label class="label">Imagem:</label></td>
                    <td><input type="file" ref="inputFile" @change="uploadFile()"></td>
                </tr>
                <br>
            <button  class="button is-info" id="button" @click="addImage()">Adicionar Imagem!</button><br><br>
            </table>
            <br>
        </form>
    </div>

</template>
<script>
import axios from 'axios';
export default{ 
    name: 'UpdateRecipe',
    data(){
        return{
            newObject: {
                id:'',
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
    mounted(){
        console.log('aqui',this.data)
        console.log((location.pathname).split('/'))
        this.id = (location.pathname).split('/')
    },
    methods: {
        addImage(){
                const params = {
                'name': this.inputName,
                'description': this.inputDescription,
                'image': this.inputPicture
                }

            let formData = new FormData()

            Object.entries(params).forEach(
                ([key, value]) => formData.append(key, value)
            )
            axios.post('/images/' + this.id[2] ,formData).then(response => {
                    console.log(response)
                })      
             
        },
        uploadFile() {
            this.inputPicture = this.$refs.inputFile.files[0];
        },
    }
}
</script>

<style>

</style>