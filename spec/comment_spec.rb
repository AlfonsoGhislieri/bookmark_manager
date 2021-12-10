
require 'comment'
require 'bookmark'

describe Comment do
  describe '.create' do
    it 'creates a new comment' do
      Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      comment = Comment.create(text: 'This is a test comment', bookmark_id: Bookmark.all.first.id)
      
      expect(comment[0]['text']).to eq 'This is a test comment'
      expect(comment[0]['bookmarks_id']).to eq Bookmark.all.first.id
    end
  end
end