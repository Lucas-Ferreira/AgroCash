class AddDescriptionsToLoanProposals < ActiveRecord::Migration[6.1]
  def change
    add_column :loan_proposals, :description, :text
  end
end
