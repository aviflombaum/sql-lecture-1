# SQL Lecture

## Overview

Welcome to your Command Line Blog. Start your blog with `./bin/blog`.

Feel free to write a post using the `new` menu! When you start your blog back up, if you use the `index` menu, you will see your brand new blog post!

## Databases

The application is not currently saving our posts. To solve this problem, we are going to introduce a database to our application. Instead of storing the posts we save in-memory (using the `@@all` pattern), we will be persisting them to a database, `db/blog-development.sqlite`.

In order to do this we will need to:

1. Setup a `posts` table in the database.
2. Modify the `Post#save` method to write to the `posts` table using SQL.
3. Modify the `Post.all` method to read from the `posts` table using SQL.
4. Figure out someway to convert our data from SQL which comes back in the form or primitive Ruby objects such as an Arrays and Strings, into `Post` instances.
5. Modify the `Post.find_by_id` method to select the correct post row from the database and also convert it into the corresponding `Post` instance.
