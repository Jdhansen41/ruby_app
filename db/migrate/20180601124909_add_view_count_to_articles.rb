class AddViewCountToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :viewCount, :integer
  end
end
