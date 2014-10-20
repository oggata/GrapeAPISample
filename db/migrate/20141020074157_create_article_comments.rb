class CreateArticleComments < ActiveRecord::Migration
  def change
    create_table :article_comments do |t|
      t.integer :article_id
      t.text :title
      t.text :detail
      t.integer :user_id
      t.text :name
      t.text :icon_url

      t.timestamps
    end
  end
end
