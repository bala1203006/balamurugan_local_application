class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :venue
      t.string :country
      t.string :city
      t.datetime :start_date
      t.datetime :end_date
      t.string :type

      t.timestamps
    end
  end
end
