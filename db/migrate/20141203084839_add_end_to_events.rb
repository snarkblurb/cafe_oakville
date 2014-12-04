class AddEndToEvents < ActiveRecord::Migration
  def change
    add_column :events, :end, :time
  end
end
