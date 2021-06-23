<template>
    <ul class="menu">
        <li class="menu-item">
        <a class="menu-link" @click="showReports">
            <p class="title is-2">Bem vindo as Receitas!!</p>
            <i class="fas fa-utensils"></i>
        </a>
        </li>
    </ul>
</template>

<script>
export default {
  name: 'SideLinks',
  methods: {
    showReports(event) {
      window.location = '/reports'
    },
    showList(event) {
      window.location = '/contacts'
    },
    showFavorites(event) {
      window.location = '/favorites'
    },
  }
}
</script>
<style>
.menu li p{
    color: #fff;
}
</style>