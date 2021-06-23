# == Schema Information
#
# Table name: recipes
#
#  id          :bigint           not null, primary key
#  description :string
#  likes       :integer
#  name        :string
#  rate        :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_recipes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients
  has_many :comments
end
