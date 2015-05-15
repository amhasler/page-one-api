class ChangeLongitudeColumnInWorks < ActiveRecord::Migration
  def change
  	change_column :works, :longitude, :decimal
  end
end
