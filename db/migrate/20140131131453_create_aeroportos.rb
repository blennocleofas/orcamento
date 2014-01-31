class CreateAeroportos < ActiveRecord::Migration
  def change
    create_table :aeroportos do |t|
      t.string :cod
      t.string :lat
      t.string :lon
      t.string :name
      t.string :city
      t.string :state
      t.string :country
      t.string :woeid
      t.string :tz
      t.string :phone
      t.string :type
      t.string :email
      t.string :url
      t.string :runway_length
      t.string :elev
      t.string :icao
      t.string :direct_flights
      t.string :carriers

      t.timestamps
    end
  end
end
