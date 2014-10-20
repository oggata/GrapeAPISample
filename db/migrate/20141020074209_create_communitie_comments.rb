class CreateCommunitieComments < ActiveRecord::Migration
  def change
    create_table :communitie_comments do |t|
      t.integer :community_id
      t.text :title
      t.text :comment
      t.text :name
      t.text :icon_url

      t.timestamps
    end
  end
end
