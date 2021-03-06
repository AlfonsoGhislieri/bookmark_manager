require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require_relative './lib/comment'
require_relative './lib/bookmark'
require_relative './database_connection_setup'

class BookmarkManager < Sinatra::Base
  set :method_override, true
  enable :sessions
  register Sinatra::Flash
  
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :index
  end

  post '/bookmarks' do
    flash[:notice] = 'Invalid url' if Bookmark.create(url: params[:bookmark_url], title: params[:bookmark_title]) == false
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/update' do
    @bookmarks = Bookmark.all
    erb(:update)
  end
    
  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title_updated], url: params[:url_updated])
    redirect '/bookmarks'
  end

  get '/comments' do
    @bookmarks = Bookmark.all
    erb(:comments)
  end
  
  post '/bookmarks/:id' do
    Comment.create(text: params[:comment], bookmark_id: params[:id])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end

