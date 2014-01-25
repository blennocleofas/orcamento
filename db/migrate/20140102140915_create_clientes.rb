class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :sobrenome
      t.references :orca, index: true
      t.timestamps
    end
  end
end
