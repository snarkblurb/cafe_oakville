class AddStartToEvents < ActiveRecord::Migration
  def change
    add_column :events, :start, :time
  end
end
