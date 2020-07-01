require 'pg'

class Bookmark

  def self.all
    connection = PG.connect(dbname: 'bookmark_manager')
    result = connection.exec('SELECT * FROM bookmarks')
    result.map { |bookmark| bookmark['url'] }
    # [
    #   "http://www.makers.tech",
    #   "http://www.google.com",
    #   "https://www.pokemon.com/uk/"
    # ]
  end

  # attr_reader :user, :url, :name, :tag_collection, :comment_collection

  # def initialize(user, url, name, tag_collection, comment_collection)  
  #   @user = user
  #   @url = url
  #   @name = name
  #   @tag_collection = tag_collection
  #   @comment_collection = comment_collection
  # end 

end