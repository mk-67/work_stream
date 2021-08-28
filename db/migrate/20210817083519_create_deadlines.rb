class CreateDeadlines < ActiveRecord::Migration[6.0]
  def change
    create_table :deadlines do |t|
      t.date       :deadline
      t.references :post, foreign_key: true
      t.timestamps
    end
  end
end
