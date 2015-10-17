class CreateMainSettings < ActiveRecord::Migration
  def change
    create_table :main_settings do |t|
      t.string :pro_title
      t.text :pro_content
      t.text :introduce
      t.text :term
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps null: false
    end
  end
end
