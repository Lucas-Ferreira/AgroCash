class ChangeAcceptedToLoanProposal < ActiveRecord::Migration[6.1]
  def change
    change_column :loan_proposals, :accepted, :string
  end
end
