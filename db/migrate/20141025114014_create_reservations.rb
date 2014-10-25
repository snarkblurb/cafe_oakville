class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.time :start
      t.time :end
      t.references :user, index: true
      t.references :event, index: true

      t.timestamps null: false
    end
  end
end
