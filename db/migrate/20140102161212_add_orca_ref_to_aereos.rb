class AddOrcaRefToAereos < ActiveRecord::Migration
  def change
    add_reference :aereos, :orca, index: true
  end
end
