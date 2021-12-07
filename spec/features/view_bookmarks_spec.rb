feature 'view bookmarks' do
  scenario 'user visits homepage and can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    Bookmark.create('http://www.makersacademy.com/')
    Bookmark.create('http://www.google.com/')
    Bookmark.create('http://www.destroyallsoftware.com/')
    
    visit('/bookmarks')
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.google.com"
  end
end