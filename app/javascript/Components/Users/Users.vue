<template>
    <div>
        <div class="card">
            <div class="row">
                <div class="col-md-12">
                    <div class="card-content">
                        <div class="header-content">
                            <div class="media-left">
                                <h1 class="card-title">Usuarios</h1>
                            </div>
                        </div>
                        <div class="card-body">
                        </div>
                        <div>
                            <div v-for="user in users" :key="user.name" class="card user-card">
                                <div @click="goToUser(user.id)">
                                    <div>
                                        <h3 >{{user.email}}</h3>
                                        <h5 class="id">ID: {{user.id}}</h5>
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
import axios from 'axios';
    export default {
        name: 'Users',
        data(){
            return{
                users: [],
            }
        },
        props: {
            data: {
                type: Array
            }
        },
        mounted(){
            console.log("aaaaaaaaaa",this.data)
            this.users = this.data
        },
        methods:{
            goToUser(id){
                window.location = '/users/' + id + '/recipes'
            }
        }
    }
</script>
