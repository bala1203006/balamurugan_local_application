class CreateSpeakers < ActiveRecord::Migration[5.0]
  def change
    create_table :speakers do |t|
      t.string :name
      t.string :country
      t.string :city

      t.timestamps
    end
  end
end
