class ChangeScaleInLatitude < ActiveRecord::Migration
  def change
  	change_column :works, :longitude, :decimal, :precision => 10, :scale => 6
  	change_column :works, :latitude, :decimal, :precision => 10, :scale => 6
  end
end
