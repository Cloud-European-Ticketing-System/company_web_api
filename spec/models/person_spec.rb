require 'spec_helper'
require_relative '../../app/models/user'


describe User do
  before do
    @matz  = { :user => { :id => 1, :name => "Matz" } }.to_json
    ActiveResource::HttpMock.respond_to do |mock|
      mock.post   "/people.json",   {}, @matz, 201, "Location" => "/people/1.json"
      mock.get    "/people/1.json", {}, @matz
      mock.put    "/people/1.json", {}, nil, 204
      mock.delete "/people/1.json", {}, nil, 200
    end
  end

  it 'has name' do
    binding.pry
    user = User.find(1)
    expect(user.name).to eq('Matz')
  end

  it 'can change name' do
    user = User.find(1)
    user.name = 'Daniel'
    user.save
    expect(user.name).to eq('Daniel')
  end

  it 'can create new user' do
    user = User.create(id: 2, name: 'ion')

  end

  it 'can be deleted' do
    user = User.find(1)
    user.destroy
    expect(user.exists?).to eq false
  end
end