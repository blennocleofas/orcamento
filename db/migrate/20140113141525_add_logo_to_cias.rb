class AddLogoToCias < ActiveRecord::Migration
  def change
    add_column :cia, :logo, :string
  end
end
