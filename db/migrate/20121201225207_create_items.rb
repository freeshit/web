class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.string :image_url
      t.float :lat
      t.float :lon
      t.integer :user_id
      t.integer :tracker_count
      t.boolean :claimed
      t.datetime :claimed_at
      t.integer :claimer_id

      t.timestamps
    end
  end
end
