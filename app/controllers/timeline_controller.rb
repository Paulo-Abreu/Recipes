class TimelineController < ApplicationController
    before_action :view_recipe, only: %i[  ]

    def index
        @recipes = Recipe.all
        @props = {
            component_name: 'timeline',
            component_data: @recipes
        }  
    end
    def view_recipe
        @recipe = (params[:id]) 
    end  
  
end 