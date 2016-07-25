class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :body
      t.integer :thought_id
      t.string  :thought_type

      t.timestamps null: false
    end
  end
end
