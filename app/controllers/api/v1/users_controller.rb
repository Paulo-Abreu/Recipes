module Api::V1
    class UsersController < Api::BaseController
        recipe = Recipe.where(user_id: params[:id])
    end
end
