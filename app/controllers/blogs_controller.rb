class BlogsController

  def call
    main
  end

  def main
    puts "Welcome to Your Blog!"
    puts ""
    puts "Main Menu: index, new, exit"
    input = gets.strip
    case input
    when "index"
      index
    when "new"
      new
    when 'exit'
      puts "Goodbye."
      exit
    else
      puts "Invalid Input"
      main
    end
  end

  def index
    puts ""
    puts "Listing All Posts:"
    Post.all.each.with_index(1) do |post,i|
      puts "#{i}. #{post.title}"
    end

    puts "Which post would you like to read?"
    post_id = gets.strip.to_i

    post = Post.find_by_id(post_id)
    if post
      puts "#{post.title}"
      puts "-------------"
      puts "#{post.content}"
      puts ""
    else
      puts "Could not find post ##{post_id}"
      puts ""
    end
    main
  end 

  def new
    puts "Create a New Post:"
    puts ""
    puts "Title:"
    post_title = gets.strip
    puts ""
    puts "Content:"
    post_content = gets.strip

    post = Post.new
    post.title = post_title
    post.content = post_content
    post.save

    puts "Post #{post.id} Saved!"
    main
  end
end