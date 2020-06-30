feature 'Testing the infrastructure of our app' do
  scenario 'Testing the user can see Hello World on the page' do
    visit('/')
    expect(page).to have_content("Bookmark Manager")
  end
end

# feature 'Testing the bookmarks page' do
#   scenario 'User is forwarded to /bookmarks and can see a list of bookmarks' do
#     visit('/')
#     click_button('my_bookmarks')
#     expect(page).to have_content("My bookmarks")
#   end
# end

feature 'Viewing bookmarks' do
  scenario 'The user can see the bookmarks' do
    visit('/bookmarks')

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
  end
end