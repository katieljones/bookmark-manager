require 'pg'

feature 'Adding bookmarks' do
  scenario 'The user can add new bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    visit('/')
    fill_in "title", :with => "Youtube"
    fill_in "url", :with => "https://www.youtube.com"
    click_button('add_bookmark')
    expect(page).to have_link('Youtube', href: 'https://www.youtube.com')
  end
end