class CreateMailboxes < ActiveRecord::Migration
  def change
    create_table :mailboxes do |t|
      t.string :description
      t.datetime :pickup_time_m_f
      t.datetime :pickup_time_sat

      t.timestamps
    end
  end
end
