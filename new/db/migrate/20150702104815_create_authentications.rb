class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
