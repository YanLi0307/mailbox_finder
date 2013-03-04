class AddNormalizedAddressToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :normalized_address, :string
  end
end
