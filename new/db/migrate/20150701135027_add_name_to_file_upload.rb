class AddNameToFileUpload < ActiveRecord::Migration
  def change
    add_column :file_uploads, :name, :string
  end
end
