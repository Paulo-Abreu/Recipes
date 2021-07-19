module Api::V1
  class FollowsController < Api::BaseController
      before_action :view_follow
      def create
          follow = Follow.new(user_id: current_user.id, following_id: @user.id) 
          if follow.save                
              render json: follow, status: 201
          else
              render json: follow.errors.messages, status: 422
          end
      end
      private
      def view_follow
          @user = User.find(params[:following_id])
      end
  end
end
