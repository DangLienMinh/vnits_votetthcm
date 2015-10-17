class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.text :detail
      t.text :pics
      t.integer :group_id
      t.integer :sport_id
      t.timestamps null: false
    end
  end
end
