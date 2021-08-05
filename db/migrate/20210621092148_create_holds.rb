class CreateHolds < ActiveRecord::Migration[6.0]
  def change
    create_table :holds do |t|
      t.boolean    :check_hold
      t.references :post,    foreign_key: true, unique: true
      t.references :channel, foreign_key: true
      t.timestamps
    end
  end
end
