class CreateFontes < ActiveRecord::Migration
  def change
    create_table :fontes do |t|
      t.string :nome
      t.text :descricao

      t.timestamps
    end
  end
end
