<template>
    <div>
        <Sidebar/>
        <component :is="loadComponent" :data="componentData" />
    </div>     
</template>

<script>
import Home from '../Home/Home.vue';
import Sidebar from '../Sidebar/Sidebar.vue';
const componentDicionary = {
  home: Home,
  sidebar: Sidebar
};
export default {
  name: 'Main',
  components: {
    Home, Sidebar,
  },
  props: {
    componentName: {
      type: String,
      required: true,
    },
    componentData: {
      type: Array
    }
  },
  computed: {
    loadComponent() {
      return componentDicionary[this.componentName]
    }
  },
}
</script>
