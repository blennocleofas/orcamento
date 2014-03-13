class CreateAtendimentos < ActiveRecord::Migration
  def change
    create_table :atendimentos do |t|
      t.string :nome_completo
      t.string :origem
      t.string :destino
      t.string :tipo
      t.string :adultos
      t.string :criancas
      t.string :nenem
      t.string :data_ida
      t.string :data_volta
      t.string :data_compra
      t.string :data_retorno_contato
      t.string :telefone
      t.string :email
      t.string :obs
      t.string :status_fila

      t.timestamps
    end
  end
end
