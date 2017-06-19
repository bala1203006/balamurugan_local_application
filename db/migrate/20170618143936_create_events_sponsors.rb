class CreateEventsSponsors < ActiveRecord::Migration[5.0]
  def change
    create_table :events_sponsors do |t|
      t.references :event, foreign_key: true
      t.references :sponsor, foreign_key: true
    end
  end
end
