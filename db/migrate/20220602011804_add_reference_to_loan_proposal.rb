class AddReferenceToLoanProposal < ActiveRecord::Migration[6.1]
  def change
    add_reference :loan_proposals, :status, null: false, foreign_key: true
  end
end
