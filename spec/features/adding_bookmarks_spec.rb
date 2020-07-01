require 'pg'

feature 'Adding bookmarks' do
  scenario 'The user can add new bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    visit('/')
    fill_in "new_bookmark", :with => "https://www.youtube.com"
    click_button('add_bookmark')
    expect(page).to have_content "https://www.youtube.com"
  end
end