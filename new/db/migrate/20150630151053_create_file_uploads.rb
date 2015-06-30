class CreateFileUploads < ActiveRecord::Migration
  def change
    create_table :file_uploads do |t|
      t.string :filename
      t.string :filepath

      t.timestamps null: false
    end
  end
end
