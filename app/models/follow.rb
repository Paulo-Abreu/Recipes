# == Schema Information
#
# Table name: follows
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  following_id :integer
#  user_id      :integer
#
class Follow < ApplicationRecord
  belongs_to :user  
  has_many  :follows
  has_many :recipes, through: :user
end
