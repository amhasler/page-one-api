class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :image_attachment
      t.string :audio_attachment
      t.string :caption
      t.string :video
      t.string :content_type
      t.boolean :featured
      t.integer :work_id
    end
  end
end
