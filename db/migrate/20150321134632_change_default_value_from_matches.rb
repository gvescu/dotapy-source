class ChangeDefaultValueFromMatches < ActiveRecord::Migration
  def change
  	change_column :matches, :start_time, :datetime, default: nil
  end
end
