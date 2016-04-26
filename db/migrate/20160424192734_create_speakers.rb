class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.date :date
      t.references :member, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
