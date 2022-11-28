require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /names" do
    it 'returns the names' do
      response = get('/names?names=Julia, Mary, Karim')

      expect(response.status).to eq(200)
      expect(response.body).to eq('Julia, Mary, Karim')
    end

    it 'returns the names' do
      response = get('/names?names=Bob, Jill, Kayleigh')

      expect(response.status).to eq(200)
      expect(response.body).to eq('Bob, Jill, Kayleigh')
    end
  end
end