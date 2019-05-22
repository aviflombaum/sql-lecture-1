require 'bundler/setup'

Bundler.require

DB = SQLite3::Database.new("./db/blog-development.sqlite")

require_all 'app'
require_relative '../db/migrate/create_posts_table'

CreatePostsTable.new.run