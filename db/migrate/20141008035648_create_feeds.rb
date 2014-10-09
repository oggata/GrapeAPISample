class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.integer :user_id
      t.text :user_name
      t.text :icon_url
      t.text :comment

      t.timestamps
    end
  end
end
