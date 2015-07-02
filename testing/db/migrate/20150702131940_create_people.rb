class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :username
      t.string :string
      t.string :lastname
      t.string :string

      t.timestamps null: false
    end
  end
end
