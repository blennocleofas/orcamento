class AddRefToAtendimento < ActiveRecord::Migration
  def change
    add_reference :atendimentos, :cliente, index: true
  end
end
