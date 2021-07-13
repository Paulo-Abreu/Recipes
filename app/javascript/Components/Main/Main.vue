<template>
    <div>
        <Sidebar/>
        <component :is="loadComponent" :data="componentData" />
    </div>     
</template>

<script>
import Home from '../Home/Home.vue';
import Sidebar from '../Sidebar/Sidebar.vue';
import List from '../List/List.vue';
import CreateRecipe from '../List/RecipesForm.vue';
import Timeline from '../Timeline/Timeline.vue';
import Users from '../Users/Users.vue';
import Userlist from '../Users/UserList.vue';
const componentDicionary = {
  list: List,
  home: Home,
  sidebar: Sidebar,
  create_recipe: CreateRecipe,
  timeline: Timeline,
  users: Users,
  userlist: Userlist,
};
export default {
  name: 'Main',
  components: {
    Home, Sidebar, List, CreateRecipe,Timeline,Users,Userlist,
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
      console.log(this.componentName)
      return componentDicionary[this.componentName]
    }
  }
}
</script>
