feature 'update bookmark' do
  
  scenario 'update url' do
    visit('/bookmarks')
    fill_in :bookmark_url, with: 'www.sherwin.com/'
    fill_in :bookmark_title, with: 'Sherwin'
    click_button 'Submit'
    click_button 'Update'
    fill_in :url_updated, with: 'www.alfonso.com/'
    click_button 'refresh'
    expect(page).to have_link('Sherwin', href:'www.alfonso.com/')
  end

  scenario 'update title' do
    visit('/bookmarks')
    fill_in :bookmark_url, with: 'www.google.com/'
    fill_in :bookmark_title, with: 'Google'
    click_button 'Submit'
    click_button 'Update'

    fill_in :title_updated, with: 'Alfonso'
    click_button 'refresh'
    expect(page).to have_content('Alfonso')
  end

end