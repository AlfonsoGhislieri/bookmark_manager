
class Comment 
  def self.create(bookmark_id:, text:)
    DatabaseConnection.query(
      "INSERT INTO comments (bookmarks_id, text) VALUES ($1, $2) RETURNING id, text, bookmarks_id;",
      [bookmark_id, text])
  end

end