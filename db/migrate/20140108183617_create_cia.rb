class CreateCia < ActiveRecord::Migration
  def change
    create_table :cia do |t|
      t.string :nome
      t.string :cod

      t.timestamps
    end
  end
end
