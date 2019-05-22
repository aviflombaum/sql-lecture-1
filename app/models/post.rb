class Post
  attr_accessor :id, :title, :content
  @@all = []

  def save
    # To take the data from a post instance and insnert it into the table.

    sql = "
      INSERT INTO posts (title, content) VALUES 
      (#{self.title}, '#{self.content}')
    "

    DB.execute(sql)
  end

  def self.all
    # [
    #   [1, "Hello World", "This is content."],
    #   [2, "SECOND POST", "YA!!!!!"],
    #   [nil, "Okay", "Hasdasda"],
    #   [nil, "Does it work?", "Please!!!!"]
    # ]

    sql = "SELECT id, title, content FROM posts"
    rows = DB.execute(sql)

    self.new_from_rows(rows)
  end

  def self.new_from_rows(rows)
    rows.map do |row|

      self.new_from_row(row)
    end
  end

  def initialize(title = nil, content = nil)
    @title = title
    @content = content
  end

  def self.new_from_row(row)
    p = Post.new(row[1], row[2])
    p.id = row[0]
    p
  end

  def ==(another_post)
    # self.object_id == another_post.object_id
    self.id == another_post.id
  end

  def self.find_by_id(id)
    self.all[id-1]
  end
end