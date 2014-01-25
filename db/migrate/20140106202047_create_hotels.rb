class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :nome
      t.string :foto
      t.string :tipo
      t.references :orca, index: true
    end
  end
end
