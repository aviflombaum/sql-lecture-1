class Post
  attr_accessor :title, :content
  @@all = []

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def id
    self.class.all.index(self)+1
  end

  def self.find_by_id(id)
    self.all[id-1]
  end
end