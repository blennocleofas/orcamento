class AddCampoEmailToOrcas < ActiveRecord::Migration
  def change
    add_column :orcas, :email, :string
  end
end
