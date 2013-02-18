class AddLatAndLngAndGmapsToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :lat, :float
    add_column :locations, :lng, :float
    add_column :locations, :gmaps, :boolean
  end
end
