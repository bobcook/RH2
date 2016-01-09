class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :gender
      t.date :birth_date
      t.string :phone_number
      t.string :email

      t.timestamps null: false
    end
  end
end
