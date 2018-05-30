# README

To start:  $ rails server -b $IP -p $PORT

Adding flash:

    flash.notice = "Article "#{@article.title}" updated!"" <-----in controller
    <p class="flash"><%= flash.notice %></p> <----in app/views/layouts/application.html.erb above yield
    
    