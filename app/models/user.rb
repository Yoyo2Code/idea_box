class User < ActiveRecord::Base
  has_secure_password

  belongs_to :role

  has_many :ideas
  has_many :ideas, as: :thoughts

  def admin?
    Role.all.where(role: "admin").include?(self.role)
  end
end
