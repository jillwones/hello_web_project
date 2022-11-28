require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/hello' do 
    name = params[:name]
    return "Hello #{name}"
  end

  post '/submit' do 
    name = params[:name]
    message = params[:message]

    return "Thanks #{name}, you send this message: #{message}"
  end

  get '/names' do 
    names = params[:names]

    return "#{names}"
  end
end

# routes = way to associate a request method to a block of code
# e.g.
# GET /     executes some code 
# GET /todos/1    executes some other code 
# POST /todos    executes some different code