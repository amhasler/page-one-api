class AddLatitudeColumnToWorks < ActiveRecord::Migration
  def change
    add_column :works, :latitude, :integer
  end
end
