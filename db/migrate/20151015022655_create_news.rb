class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.boolean :publish
      t.text :desc
      t.text :summary
      t.integer :user_id
      t.timestamps null: false
    end
    add_attachment :news, :image
  end
end
