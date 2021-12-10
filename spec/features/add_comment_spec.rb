feature 'adding comments' do
  scenario 'user adds a comment' do
    visit('/bookmarks')
    fill_in :bookmark_url, with: 'http://www.sherwin.com'
    fill_in :bookmark_title, with: 'Sherwin'
    click_button 'Submit'
    click_button 'Add Comment'
    fill_in :comment, with: "This is Sherwin's website"
    click_button 'Submit Comment'
    expect(page).to have_content "This is Sherwin's website"
  end
end