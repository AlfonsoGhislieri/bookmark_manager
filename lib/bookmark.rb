require 'uri'
require_relative './database_connection'

class Bookmark
  attr_reader :id, :url, :title

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookmarks;")
    result.map{|bookmark| Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url']) }
  end

  def self.create(url:, title:)
    return false if !valid_url(url) 
    DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES($1, $2);", [url, title]) 
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id='#{id}'")
  end

  def self.update(id:, url:"", title:"")
    url = find_bookmark(id:id).url if url == ""
    title = find_bookmark(id:id).title if title == ""
    DatabaseConnection.query("UPDATE bookmarks SET url =$1, title=$2 WHERE id =$3;", [url,title,id])
  end

  def self.valid_url(url)
    valid_endings = ['com','org','net','co.uk']
    uri = URI(url)
    uri.scheme != nil && valid_endings.include?(url.split('.').last)
  end

end

private 

def find_bookmark(id:)
  Bookmark.all.find { |bookmark| bookmark.id == id }
end
