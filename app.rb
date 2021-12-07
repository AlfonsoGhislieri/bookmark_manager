require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions 
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    @bookmark = session[:bookmark]
    erb :index
  end

  post '/bookmarks' do
    session[:bookmark] = params[:bookmark_url]
    redirect '/bookmarks'
  end

  run! if app_file == $0
end

