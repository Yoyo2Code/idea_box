class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_many :ideas_images
  has_many :images, through: :ideas_images
  
  belongs_to :thoughts, polymorphic: true
end
