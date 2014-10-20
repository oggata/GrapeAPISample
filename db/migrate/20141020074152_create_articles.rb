class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.text :detail
      t.text :tag
      t.text :thumbnail_url
      t.text :url

      t.timestamps
    end
  end
end
