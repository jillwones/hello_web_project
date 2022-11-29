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

  context 'POST /sort-names' do 
    it 'returns the names sorted in alphabetical order' do 
      response = post('/sort-names', names: 'Joe,Alice,Zoe,Julia,Kieran')

      expect(response.status).to eq(200)
      expect(response.body).to eq('Alice,Joe,Julia,Kieran,Zoe')
    end
  end

  context "GET to /" do
    it 'contains a h1 title' do
      response = get('/')
  
      expect(response.body).to include('<h1>Welcome to my page</h1>')
    end
  end

  context "GET to /hello" do 
    it 'contains a h1 title' do 
      response = get('/hello') 

      expect(response.body).to include('<h1>Hello!</h1>')
    end
  end
end