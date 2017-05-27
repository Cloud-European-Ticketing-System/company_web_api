class User < ApplicationResource
  belongs_to :company
  validates_presence_of :first_name, :last_name, :email, :country, :address, :telephone, :password, :role
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end