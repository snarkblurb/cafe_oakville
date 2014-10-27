class RemoveEndFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :end, :time
  end
end
