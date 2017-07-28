class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :url
      t.integer :reads, default: 0

      t.timestamps
    end
  end
end
