class AddCampoEmailToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :email, :string
  end
end
