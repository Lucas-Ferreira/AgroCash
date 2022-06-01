class CreateLoanProposals < ActiveRecord::Migration[6.1]
  def change
    create_table :loan_proposals do |t|
      t.string :conditions
      t.float :amount
      t.boolean :accepted
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
