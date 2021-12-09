require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/bookmark'
require_relative './database_connection_setup'

class BookmarkManager < Sinatra::Base
  set :method_override, true
  
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
    Bookmark.create(url: params[:bookmark_url], title: params[:bookmark_title])
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

  run! if app_file == $0
end

