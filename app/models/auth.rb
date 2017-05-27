class Auth < ApplicationResource
  validates_presence_of :email, :password
end