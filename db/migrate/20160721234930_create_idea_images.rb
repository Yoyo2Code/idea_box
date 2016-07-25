class CreateIdeaImages < ActiveRecord::Migration
  def change
    create_table :idea_images do |t|
      t.references :idea
      t.references :image
    end
  end
end
