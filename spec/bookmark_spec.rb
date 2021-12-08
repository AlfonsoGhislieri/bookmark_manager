require 'bookmark'
require 'database_connection'

describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com/', title: 'Makers Academy')
      Bookmark.create(url: 'http://www.google.com/', title: 'Google')
      Bookmark.create(url: 'http://www.destroyallsoftware.com/', title: 'Destroy All Software')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com/'
    end
  end

  describe '.create' do
    it 'should add a new bookmark' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      Bookmark.create(url: 'www.sherwin.com', title: 'Sherwin')
      bookmarks = Bookmark.all
      expect(bookmarks.first.url).to eq "www.sherwin.com"
    end
  end

  describe '.delete' do
    it 'should delete a bookmark' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      bookmark = Bookmark.create(url: 'www.sherwin.com', title: 'Sherwin')
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.empty?).to be_truthy
    end
  end

end
