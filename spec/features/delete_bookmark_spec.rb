feature 'deleting bookmarks' do
  scenario 'bookmark no longer shown on page after deletion' do
    visit('/bookmarks')
    fill_in :bookmark_url, with: 'http://www.google.com'
    fill_in :bookmark_title, with: 'Google'
    click_button 'Submit'
    click_button 'Delete'
    expect(page).to_not have_content('Google')
  end
end