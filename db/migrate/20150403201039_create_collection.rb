class CreateCollection < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :title
      t.integer :user_id
    end
  end
end
