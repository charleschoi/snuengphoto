class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.integer :photo_abc
      t.string :title
      t.string :where
      t.string :when
      t.string :description
      t.string :photo_saved_name
      t.string :photo_real_name

      t.timestamps
    end
  end
end
