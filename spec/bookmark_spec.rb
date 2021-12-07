require 'bookmark'
require 'database_connection'

describe Bookmark do
  let(:subject) { described_class.new }

  describe '.all' do
    it 'returns a list of bookmarks' do
      expect(Bookmark.all).to include("http://www.makersacademy.com/")
      expect(Bookmark.all).to include("http://www.google.com/")
      expect(Bookmark.all).to include("http://www.destroyallsoftware.com/")
    end
  end


end
