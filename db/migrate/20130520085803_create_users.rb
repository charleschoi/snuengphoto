class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_hash
      t.string :name
      t.integer :dept_id
      t.string :student_id
      t.string :phone
      t.string :find_pw_code

      t.timestamps
    end
  end
end
