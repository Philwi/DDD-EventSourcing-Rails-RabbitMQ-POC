class CreateEventSourc < ActiveRecord::Migration[7.0]
  def change
    create_table :event_sources do |t|
      t.string :queue_name
      t.text :payload, default: '{}'
      t.string :routing_key
      t.string :exchange_name
      t.timestamps
    end
  end
end
