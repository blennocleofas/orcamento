class RenaToOcamentos < ActiveRecord::Migration
  def change
  	rename_table :orcamentos, :orcas
  end
end
