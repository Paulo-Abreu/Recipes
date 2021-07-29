class TimelineController < ApplicationController
    before_action :view_recipe, only: %i[ index ]
    def index
        @recipes = current_user.recipes.map { |r| map_to_json(r) }
        @props = {
            component_name: 'timeline',
            component_data: @recipes
        }  
    end
    private
    def view_recipe
        @recipe = (params[:id]) 
    end  
    def map_to_json(recipe)
        {id: recipe.id, name: recipe.name, description: recipe.description, image: rails_blob_path(recipe.image, disposition: "attachment")}
    end
end 