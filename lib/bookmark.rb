require_relative './database_connection'

class Bookmark
  def self.all
    connect
    result = DatabaseConnection.query("SELECT * FROM bookmarks;")
    result.map{|bookmark| bookmark["url"]}
  end


  def self.create(url)
    connect
    DatabaseConnection.query("INSERT INTO bookmarks (url) VALUES('#{url}');")
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
