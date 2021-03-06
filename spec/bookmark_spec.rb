require 'bookmark'
require 'database_connection'

describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do
      Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      Bookmark.create(url: 'http://www.google.com', title: 'Google')
      Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
      expect(bookmarks.last.title).to eq 'Destroy All Software'
      expect(bookmarks.last.url).to eq 'http://www.destroyallsoftware.com'
    end
  end

  describe '.create' do
    it 'should add a new bookmark' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      Bookmark.create(url: 'http://www.sherwin.com', title: 'Sherwin')
      bookmarks = Bookmark.all
      expect(bookmarks.first.url).to eq "http://www.sherwin.com"
    end
  end

  describe '.delete' do
    it 'should delete a bookmark' do
      Bookmark.create(url: 'http://www.sherwin.com', title: 'Sherwin')
      Bookmark.delete(id: Bookmark.all.first.id)
      expect(Bookmark.all.empty?).to be_truthy
    end
  end

  describe '.update' do
    it 'should update url' do
      Bookmark.create(url: 'http://www.sherwin.com', title: 'Sherwin')
      Bookmark.update(id: Bookmark.all.first.id,url: 'http://www.alfonso.com')
      expect(Bookmark.all[0].url).to eq('http://www.alfonso.com')
    end
    
    it 'should update title' do
      Bookmark.create(url: 'http://www.sherwin.com', title: 'Sherwin')
      Bookmark.update(id: Bookmark.all.first.id,title: 'Alfonso')
      expect(Bookmark.all[0].title).to eq('Alfonso')
    end

  end

  describe '.comment' do
    it 'should return array from comments' do

      Bookmark.create(url: 'http://www.sherwin.com', title: 'Sherwin')
      bookmark = Bookmark.new(id: Bookmark.all.first.id, title: Bookmark.all.first.title, url: Bookmark.all.first.url )

      DatabaseConnection.query(
        "INSERT INTO comments (text, bookmarks_id) VALUES('Test comment', $1)",
        [bookmark.id])

      expect(bookmark.comments(bookmark.id)).to eq(["Test comment"])
    end
  end

end
