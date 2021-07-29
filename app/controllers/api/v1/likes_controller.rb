class LikesController < ApplicationController
    before_action :find_recipe
    def create
        recipe = Like.new(user: current_user.id, recipe_id: @recipe_id) 

        @post.likes.create(user_id: current_user.id)
        redirect_to post_path(@post)
    end
    
    private
    
    def find_recipe
        @recipe_id =(params[:recipe_id])
    end
 end