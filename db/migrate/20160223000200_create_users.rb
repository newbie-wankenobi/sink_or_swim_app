class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.float :height
      t.float :weight
      t.date :born_on
      t.string :gender
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
