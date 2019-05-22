class CreatePostsTable
  def run
    sql = "CREATE TABLE IF NOT EXISTS posts  (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            content TEXT
    )"

    DB.execute(sql)
  end
end
