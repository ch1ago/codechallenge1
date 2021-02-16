class CreateTransfers < ActiveRecord::Migration[6.1]
  def change
    create_table :transfers do |t|
      t.references :org, null: false, foreign_key: true
      t.integer :kind
      t.datetime :at
      t.decimal :amount, precision: 5, scale: 2
      t.string :cpf
      t.string :card_number
      t.string :store_name
      t.string :store_owner

      t.timestamps
    end
  end
end
