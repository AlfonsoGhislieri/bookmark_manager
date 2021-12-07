feature 'adding bookmarks' do
  scenario 'user fills in form and submits' do
    visit('/bookmarks')
    fill_in :bookmark_url, with: 'www.sherwin.com'
    click_button 'Submit'
    expect(page).to have_content 'www.sherwin.com'
  end
end