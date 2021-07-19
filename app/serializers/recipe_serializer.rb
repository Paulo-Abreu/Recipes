class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :description, :name   
  has_many :comments
end
