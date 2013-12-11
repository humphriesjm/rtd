class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :event_id
      t.integer :user_id
      t.string :name
      t.boolean :paid
      t.float :price

      t.timestamps
    end
  end
end
