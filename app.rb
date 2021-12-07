require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
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

  run! if app_file == $0
end

