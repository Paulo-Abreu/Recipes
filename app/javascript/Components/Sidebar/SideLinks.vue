<template>
    <ul class="menu">
        <li class="menu-item">
        <a class="menu-link">
            <p @click="goToHome" class="title is-2">Bem vindo as Receitas!!</p>
            <i class="fas fa-utensils"></i>
        </a>
        </li>

        <li class="menu-item">
        <a @click="goToTimeline" class="menu-link">
            <p class="title is-2">Timeline</p>
            </a>
        </li>


        <li class="menu-item">
        <a @click="goToUsers" class="menu-link">
            <p class="title is-2">Users</p>
            </a>
        </li>
    </ul>
</template>

<script>
export default {
    name: 'SideLinks',
    
    methods:{
        goToTimeline(){
            window.location = '/timeline'
        },
        goToHome(){
            window.location = '/'
        },
        goToUsers(){
            window.location = '/users'
        }
    }
}
</script>
<style>
.menu li p{
    color: #fff;
}
</style>