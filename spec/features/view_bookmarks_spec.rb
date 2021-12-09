feature 'view bookmarks' do
  scenario 'user visits homepage and can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    Bookmark.create(url: 'http://www.google.com', title: 'Google')
    Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
    
    visit('/bookmarks')
    expect(page).to have_link("Makers Academy", href: "http://www.makersacademy.com")
  end
end


