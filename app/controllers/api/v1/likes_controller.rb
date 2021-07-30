module Api::V1
    class LikesController < Api::BaseController
        before_action :find_like
        def create
            like = Like.new(user: current_user, recipe_id: @recipe.id) 
            if already_liked?             
                render json: {message: 'NÃO É POSSIVEL DAR MAIS DE UM LIKE'} , status: 201
            else
                @recipe.likes.create(user: current_user)
            end

            
        end
        
        private
        def already_liked?
            Like.where(user: current_user, recipe_id: params[:recipe_id]).exists?
        end
        
        def find_like
            @recipe = Recipe.find(params[:recipe_id])
        end
    end
end