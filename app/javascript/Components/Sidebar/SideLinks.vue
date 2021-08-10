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
            <p class="title is-2"><i class="fas fa-project-diagram"></i> Timeline</p>
            </a>
        </li>

        <li class="menu-item">
        <a @click="goToUsers" class="menu-link">
            <p class="title is-2"><i class="fas fa-user"></i> Users</p>
            </a>
        </li>
        
        <li class="menu-item">
            <notifications group="like" />
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
    },
    channels: {
        NotificationsChannel: {
            connected() {
              console.log('connected');
            },
            rejected() {},
            received(data){
                console.log('ssssss',data)
               this.$notify({
                    group: 'like',
                    text: 'A receita: ' + data.data +' recebeu um like!'
                }); 
            },
            disconnected() {}
        }
  },
    mounted(){
        this.$cable.subscribe({ channel: 'NotificationsChannel'});
    }

}
</script>
<style>
.menu li p{
    color: #fff;
}
</style>