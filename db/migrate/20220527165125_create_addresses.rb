class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :street
      t.string :number
      t.string :neighborhood
      t.string :cep
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
