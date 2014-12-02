class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :image_name
      t.binary :image

      t.timestamps
    end
  end
end
