module Api::V1
  class CommentsController < Api::BaseController
    before_action :view_comment
      def create
          comment = Comment.new(user_id: current_user.id, recipe_id: @recipe_id, content: @comment) 
          if comment.save                
              render json: comment, status: 201
          else
              render json: comment.errors.messages, status: 422
          end
      end
      private
      def view_comment
        @comment =(params[:comment])
        @recipe_id =(params[:recipe_id])
      end
  end
end

