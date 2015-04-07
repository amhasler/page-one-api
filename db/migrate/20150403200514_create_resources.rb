class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :link
      t.string :description
      t.integer :work_id
    end
  end
end
