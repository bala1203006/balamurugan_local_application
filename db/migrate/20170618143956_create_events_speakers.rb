class CreateEventsSpeakers < ActiveRecord::Migration[5.0]
  def change
    create_table :events_speakers do |t|
      t.references :event, foreign_key: true
      t.references :speaker, foreign_key: true
    end
  end
end
