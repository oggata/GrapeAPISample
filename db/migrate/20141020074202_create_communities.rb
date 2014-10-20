class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.text :title
      t.text :comment
      t.text :tag
      t.text :thumbnail_url
      t.text :url

      t.timestamps
    end
  end
end
