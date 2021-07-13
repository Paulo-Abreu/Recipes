class UsersController < ApplicationController
    before_action :view_user, only: %i[  ]

    def index
        @users = User.all
        @props = {
            component_name: 'users',
            component_data: @users
        }  
    end

    def show
        @recipes = Recipe.where(user_id: params[:id])
        @props = {
            component_name: 'userlist',
            component_data: @recipes
        }  
    end

    private
    def view_user
        @user = (params[:id]) 
    end  
end 