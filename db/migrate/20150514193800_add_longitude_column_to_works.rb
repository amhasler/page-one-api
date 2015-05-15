class AddLongitudeColumnToWorks < ActiveRecord::Migration
  def change
    add_column :works, :longitude, :integer
  end
end
