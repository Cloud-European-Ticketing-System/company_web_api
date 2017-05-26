require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase
  def setup
    @matz  = { :person => { :id => 1, :name => "Matz" } }.to_json
    ActiveResource::HttpMock.respond_to do |mock|
      mock.post   "/people.json",   {}, @matz, 201, "Location" => "/people/1.json"
      mock.get    "/people/1.json", {}, @matz
      mock.put    "/people/1.json", {}, nil, 204
      mock.delete "/people/1.json", {}, nil, 200
    end
  end

  def test_get_matz
    person = Person.find(1)
    assert_equal "Matz", person.name
  end
end
