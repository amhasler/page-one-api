class RenameDateColumnToMinYearInWorks < ActiveRecord::Migration
  def change
  	rename_column :works, :date, :min_year
  end
end
