<template>
    <div class="sidebar">
        <div class="sidebarWrapper">
            <SideLinks/>
        </div>
    </div>
</template>

<script>
import SideLinks from './SideLinks.vue';
export default {
  name: 'Sidebar',
  components: { SideLinks },
}
</script>
<style>
.sidebar {
    color: #fff;
    position: fixed;
    top: 0;
    bottom: 0;
    left: 0;
    z-index: 1;
    width: 260px;
    background: #b85f00;
  }
  .sidebar .menu li a
  {
    margin: 10px 15px;
    color: #fff;
    font-size: 16px;
    padding: 10px 15px;
    cursor: pointer;
  }
  .sidebar .menu p 
  {
    font-size: 16px;    
  }
    .menu-item {
    display: flex;
    }
</style>
