feature 'adding bookmarks' do
  scenario 'user fills in form and submits' do
    visit('/bookmarks')
    fill_in :bookmark_url, with: 'http://www.sherwin.com'
    fill_in :bookmark_title, with: 'Sherwin'
    click_button 'Submit'
    expect(page).to have_link("Sherwin", href: "http://www.sherwin.com")
  end
end