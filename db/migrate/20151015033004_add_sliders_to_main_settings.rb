class AddSlidersToMainSettings < ActiveRecord::Migration
  def change
    add_column :main_settings, :sliders, :string
  end
end
