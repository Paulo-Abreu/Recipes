class NotificationsBroadcastJob < ApplicationJob
    queue_as :default
  
    def perform(like)
      ActionCable.server.broadcast("notifications_channel", { data: like.recipe.name })    
    end
  end