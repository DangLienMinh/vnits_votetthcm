class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.integer :subject_id
      t.string :link
      t.timestamps
    end

    add_attachment :uploads, :image
  end
end
