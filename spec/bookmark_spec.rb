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

  describe '.delete' do
    it 'deletes a bookmarks' do
    bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

    Bookmark.delete(id: bookmark.id)

    expect(Bookmark.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'updates a bookmark' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.makerstech.com', title: 'Makers')

    expect(updated_bookmark).to be_a Bookmark
    expect(updated_bookmark.id).to eq bookmark.id
    expect(updated_bookmark.title).to eq 'Makers'
    expect(updated_bookmark.url).to eq 'http://www.makerstech.com'
    end

  end

  describe '.find' do
    it 'returns the rquested bookmark' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      result = Bookmark.find(id: bookmark.id)
      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Makers Academy'
      expect(result.url).to eq 'http://www.makersacademy.com'
    end

  end
