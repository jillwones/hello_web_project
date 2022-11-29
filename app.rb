require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/hello' do 
    return erb(:hello)
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

  post '/sort-names' do 
    names = params[:names]
    array_names = names.split(',')
    array_names.sort!
    return array_names.join(',')
  end

  get '/' do 
    return erb(:index)
  end
end

# routes = way to associate a request method to a block of code
# e.g.
# GET /     executes some code 
# GET /todos/1    executes some other code 
# POST /todos    executes some different code