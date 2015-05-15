class ChangeLatitudeAgainInWorks < ActiveRecord::Migration
  def change
  	change_column :works, :latitude, :decimal
  end
end
