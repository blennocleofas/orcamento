class AddCamposToAereos < ActiveRecord::Migration
  def change
    add_column :aereos, :origem, :string
    add_column :aereos, :destino, :string
  end
end
