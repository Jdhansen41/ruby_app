# README

To start:  $ rails server -b $IP -p $PORT

Adding flash:

    flash.notice = "Article "#{@article.title}" updated!"" <-----in controller
    <p class="flash"><%= flash.notice %></p> <----in app/views/layouts/application.html.erb above yield
    
    
Adding comments:
    -A comment should be attached to an article, have an author name, and have a body
    1. Create model: bin/rails generate model Comment author_name:string body:text article:references
    2. Migration field created under db/migrate/_some migration name here_, run the migration with bin/rake db:migrate
    3. We need to join together an article in the articles table with its comments in the comment table. Do this using foreign keys
        -under app/models/comment.rb
            class Comment < ApplicationRecord
                belongs_to :article
            end
        -under app/models/article.rb
                has_many :comments
        
        -Here's how to create a comment in the console:
            a = Article.first #article we'll target
            c= a.comments.create(author_name: "Dixie", body: "RUFF") #create will build and save comment in one step, unlike using the "new" method
    4. Create comment form, add comments to show method for articles
    5. Add comment route to config/routes
    5. Generate comments controller
    
Tagging:
-Used to assign articles to categories. Tag has MANY articles (potentially) and article can have MANY tags. Many to Many relationship
-We'll call this Tagging. An Article has many taggings, and a tag has many taggings
-We'll need two models:
    Tag: name- a string
    Tagging: tag_id and article_id
    
    bin/rails generate model Tag name:string
    bin/rails generate model Tagging tag:references article:references
    bin/rake db:migrate
-models/article.rb      -> has_many :tags, through: :taggings
-models/tag.rb          _> has_many :articles, through:  :taggings
    Now we can use article.tags for all tags on an article, or tag.articles for all articles with a tag
    
    in the console:
        a = Article.first
        a.tags.create name: "tag1"
        a.tags.create name: "tag2"
        a.tags  <-Will list an array of tags on the article->
-Generate tags controller