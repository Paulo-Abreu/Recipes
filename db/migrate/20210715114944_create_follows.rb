class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.integer :following_id
      t.integer :user_id

      t.timestamps
    end
  end
end
