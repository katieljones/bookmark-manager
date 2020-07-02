require './lib/bookmark'
require 'database_helpers'

describe Bookmark do

  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.create(url: "http://www.google.com", title: "Google")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq "Makers Academy"
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end

  end

  describe '.create' do
    it 'creates new bookmarks'do
    bookmark = Bookmark.create(url: 'https://www.youtube.com', title: 'Youtube')
    persisted_data = persisted_data(id: bookmark.id)

    expect(bookmark).to be_a Bookmark
    expect(bookmark.id).to eq persisted_data['id']
    expect(bookmark.title).to eq 'Youtube'
    expect(bookmark.url).to eq 'https://www.youtube.com'
    end
  end
end

  # let (:bookmark) {Bookmark.new("Josh", "www.makers.tech", "Makers", "Bootcamp, Tech, Coding", "This is a comment.")}

  # it 'should create a new bookmark' do
  #   expect(bookmark).to be_an_instance_of(Bookmark)
  # end

  # it 'should assign an owner on initialize' do
  #   expect(bookmark.user).to eq("Josh")
  # end

  # it 'should assign an owner on initialize' do
  #   expect(bookmark.url).to eq("www.makers.tech")
  # end

  # it 'should assign an owner on initialize' do
  #   expect(bookmark.name).to eq("Makers")
  # end

  # it 'should assign an owner on initialize' do
  #   expect(bookmark.tag_collection).to eq("Bootcamp, Tech, Coding")
  # end

  # it 'should assign an owner on initialize' do
  #   expect(bookmark.comment_collection).to eq("This is a comment.")
  # end

