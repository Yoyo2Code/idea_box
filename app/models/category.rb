class Category < ActiveRecord::Base
  # has_many :ideas
  has_many :ideas, as: :thoughts
end
