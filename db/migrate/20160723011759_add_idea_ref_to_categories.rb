class AddIdeaRefToCategories < ActiveRecord::Migration
  def change
    add_reference :categories, :idea, index: true, foreign_key: true
  end
end
