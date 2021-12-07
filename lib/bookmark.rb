require_relative './database_connection'

class Bookmark
  def self.all
    if ENV['ENVIRONMENT'] == 'test' 
      DatabaseConnection.setup('bookmark_manager_test')
    else
      DatabaseConnection.setup('bookmark_manager')
    end
    result = DatabaseConnection.query("SELECT * FROM bookmarks;")
    result.map{|bookmark| bookmark["url"]}
  end
end