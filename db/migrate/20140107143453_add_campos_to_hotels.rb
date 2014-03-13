class AddCamposToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :data_ida, :date
    add_column :hotels, :data_volta, :date
  end
end
