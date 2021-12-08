require_relative './database_connection'

class Bookmark
  attr_reader :id, :url, :title

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    connect
    result = DatabaseConnection.query("SELECT * FROM bookmarks;")
    result.map{|bookmark| Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url']) }
  end

  def self.create(url:, title:)
    connection = connect
    result = connection.exec_params("INSERT INTO bookmarks (url, title) VALUES($1, $2) RETURNING id, title, url;", [url, title]
  )
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    connect
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id='#{id}'")
  end
end

private 

def connect
  if ENV['ENVIRONMENT'] == 'test' 
    DatabaseConnection.setup('bookmark_manager_test')
  else
    DatabaseConnection.setup('bookmark_manager')
  end
end
