class CreateFileuploads < ActiveRecord::Migration
  def change
    create_table :fileuploads do |t|
      t.string :filename
      t.string :filepath
      t.integer :authentication_id

      t.timestamps null: false
    end
  end
end
