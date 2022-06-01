class LoanAccepted < ApplicationRecord
  belongs_to :user
  belongs_to :loan_proposal
end
