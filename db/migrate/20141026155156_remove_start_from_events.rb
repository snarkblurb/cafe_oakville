class RemoveStartFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :start, :time
  end
end
