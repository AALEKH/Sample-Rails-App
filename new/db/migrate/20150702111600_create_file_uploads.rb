class CreateFileUploads < ActiveRecord::Migration
  def change
    create_table :file_uploads do |t|
      t.string :filename
      t.string :filepath
      t.integer :authentication_id

      t.timestamps null: false
    end
  end
end
