require 'sinatra/base'
require './lib/bookmark'

class Bookmark_Manager < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/add_bookmark' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect to('/bookmarks')
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  run! if app_file == $0
end