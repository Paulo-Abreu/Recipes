# == Schema Information
#
# Table name: ingredients
#
#  id            :integer          not null, primary key
#  name          :string
#  quantity      :float
#  unity_mesaure :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  recipe_id     :integer          not null
#
# Indexes
#
#  index_ingredients_on_recipe_id  (recipe_id)
#
# Foreign Keys
#
#  recipe_id  (recipe_id => recipes.id)
#
require "test_helper"

class IngredientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
