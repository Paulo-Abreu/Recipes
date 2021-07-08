module Api::V1
    class RecipesController < Api::BaseController
        def create
            ingredients = recipe_params[:ingredientsInput]
            recipe = Recipe.new(recipe_params.except(:ingredientsInput))
            recipe.user = current_user
            if recipe.save
                ingredients.each do |ingredient|
                    Ingredient.create!(name: ingredient[:name], quantity: ingredient[:quantity], unity_measure: ingredient[:unity_measure], recipe_id: recipe[:id]) 
                end
                render json: recipe, status: 201
            else
                render json: recipe.errors.messages, status: 422
            end
        end
        private
        def recipe_params
            params.require(:recipe).permit(:name, :description, ingredientsInput: [:name, :quantity, :unity_measure])
        end
    end
end
