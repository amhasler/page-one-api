class AddMaxYearColumnToWorks < ActiveRecord::Migration
  def change
    add_column :works, :max_year, :integer
  end
end
