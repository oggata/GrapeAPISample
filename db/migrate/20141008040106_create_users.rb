class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :name
      t.text :comment
      t.text :icon_url

      t.timestamps
    end
  end
end
