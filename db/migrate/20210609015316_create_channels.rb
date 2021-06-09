class CreateChannels < ActiveRecord::Migration[6.0]
  def change
    create_table :channels do |t|
      t.string :channel, null: false
      t.timestamps
    end
  end
end
