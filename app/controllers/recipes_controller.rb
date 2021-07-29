class RecipesController < ApplicationController
    before_action :view_recipe, only: %i[ edit ]

    def index
        @recipes = Recipe.where(user_id: current_user.follows.pluck(:following_id))
        @recipes = @recipes.map { |r| ActiveModel::SerializableResource.new(r) }      
        @myRecipes = current_user.recipes
        @props = {
            component_name: 'list',
            component_data: [@recipes, @myRecipes ]
        }  
    end

    def edit
        @props = {
            component_name: 'update_recipe',
            component_data: [@recipe]
        }  
    end
    def new
        @props = {
            component_name: 'create_recipe',
        }      
    end

    private

    def view_recipe
        @recipe = Recipe.find(params[:id]) 
    end  
    def recipe_params
        params.require(:recipe).permit(:name, :description, ingredients_attributes: [:name, :quantity, :unity_measure])
    end
end 
