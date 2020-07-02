require 'pg'

feature 'Testing the infrastructure of our app' do
  scenario 'Testing the user can see Hello World on the page' do
    visit('/')
    expect(page).to have_content("Bookmark Manager")
  end
end


feature 'Viewing bookmarks' do
  scenario 'The user can see the bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
    Bookmark.create(url: 'http://www.google.com', title: 'Google')

    visit('/bookmarks')

    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy All Software',  href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end
end