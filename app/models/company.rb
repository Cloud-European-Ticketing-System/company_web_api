class Company < ActiveResource::Base
  has_many :users
  self.site = 'http://localhost:1990'
end