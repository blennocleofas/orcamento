class CreateOrcas < ActiveRecord::Migration
  def change
    create_table :orcas do |t|
      t.string :titulo
      t.references :cliente, index: true
      t.timestamps
    end
  end
end
