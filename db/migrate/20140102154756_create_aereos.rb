class CreateAereos < ActiveRecord::Migration
  def change
    create_table :aereos do |t|
      t.string :voo
      t.string :cia
      t.string :ida
      t.string :volta
      t.string :obs
      t.string :duracao
      t.string :tarifa
      t.string :taxa

      t.timestamps
    end
  end
end
