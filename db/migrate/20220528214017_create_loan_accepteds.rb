class CreateLoanAccepteds < ActiveRecord::Migration[6.1]
  def change
    create_table :loan_accepteds do |t|
      t.boolean :acepted
      t.references :user, null: false, foreign_key: true
      t.references :loan_proposal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
