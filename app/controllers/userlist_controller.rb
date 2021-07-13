class USerlistController < ApplicationController
    before_action :view_recipe, only: %i[  ]

    def index
        @recipes = Recipe.where(user_id: params[:user_id])
        @props = {
            component_name: 'Userlist',
            component_data: @recipes
        }  
    end
    def view_recipe
        @recipe = (params[:id]) 
    end  
end 