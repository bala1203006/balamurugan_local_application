class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :phone_no
      t.string :password
      t.string :father_name
      t.string :mother_name
      t.string :profession
      t.string :city
      t.string :state
      t.string :country
      t.string :role

      t.timestamps
    end
  end
end
