require 'bookmark'
require 'database_connection'

describe Bookmark do
  let(:subject) { described_class.new }

  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com/');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com/');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com/');")

      expect(Bookmark.all).to include("http://www.makersacademy.com/")
      expect(Bookmark.all).to include("http://www.google.com/")
      expect(Bookmark.all).to include("http://www.destroyallsoftware.com/")
    end
  end


end
