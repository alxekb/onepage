class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :a
      t.integer :b
      t.string :cmd
      t.string :result

      t.timestamps
    end
  end
end
