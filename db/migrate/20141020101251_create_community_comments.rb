class CreateCommunityComments < ActiveRecord::Migration
  def change
    create_table :community_comments do |t|
      t.integer :community_id
      t.text :title
      t.text :comment
      t.integer :user_id
      t.text :name
      t.text :icon_url

      t.timestamps
    end
  end
end
