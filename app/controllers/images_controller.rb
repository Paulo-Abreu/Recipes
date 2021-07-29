class ImagesController < ActionController::API
    before_action :view_recipe, only: %i[ create ]
    def create
        upload
        image = rails_blob_path(@recipe.image, disposition: "attachment")
        if @recipe.persisted?
            render json: image, status: 200
        else
            render json: image, status: 400
        end

    end

    def upload
        @recipe.image.attach(params[:image])                                                                                            
    end
    
    private

    def view_recipe
        @recipe = Recipe.find(params[:id])
    end
end
  
