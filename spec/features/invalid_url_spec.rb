
feature 'invalid url' do
  
  scenario 'error message shown if user registers invalid url' do
    visit('/bookmarks')
    fill_in :bookmark_url, with: 'Alfonso'
    fill_in :bookmark_title, with: 'Sherwin'
    click_button 'Submit'
    expect(page).to have_content 'Invalid url'
  end

end