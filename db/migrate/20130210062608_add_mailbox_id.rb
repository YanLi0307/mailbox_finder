class AddMailboxId < ActiveRecord::Migration
  def change
     add_column :locations, :mailbox_id, :string
  end
end
