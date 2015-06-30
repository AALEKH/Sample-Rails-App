class CreateFileUploads < ActiveRecord::Migration
  def change
    create_table :file_uploads do |t|
      t.string :filename
      t.string :string

      t.timestamps null: false
    end
  end
end
