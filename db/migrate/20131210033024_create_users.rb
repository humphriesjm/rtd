class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :address
      t.string :email
      t.string :phone
      t.string :org
      t.date :birthdate
      t.float :weight
      t.float :height
      t.string :sex

      t.timestamps
    end
  end
end
