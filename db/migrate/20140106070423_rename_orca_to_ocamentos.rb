class RenameOrcaToOcamentos < ActiveRecord::Migration
  def change
  	rename_table :orcas, :orcamentos
  end
end
