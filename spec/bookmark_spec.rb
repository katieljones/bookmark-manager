require './lib/bookmark'

describe Bookmark do

  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include "http://www.makersacademy.com"
      expect(bookmarks).to include "http://www.google.com"
      expect(bookmarks).to include "http://www.destroyallsoftware.com"
    end

  end

  describe '.create' do
    it 'creates new bookmarks'do
    Bookmark.create(link: 'https://www.youtube.com')
    expect(Bookmark.all).to include 'https://www.youtube.com'
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

