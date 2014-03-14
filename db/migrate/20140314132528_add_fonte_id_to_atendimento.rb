class AddFonteIdToAtendimento < ActiveRecord::Migration
  def change
    add_column :atendimentos, :atendimento, :string
    add_column :atendimentos, :fonte_id, :integer
  end
end
