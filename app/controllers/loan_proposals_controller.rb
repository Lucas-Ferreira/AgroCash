class LoanProposalsController < ApplicationController

  def new
    @loan_proposal = LoanProposal.new
    autorize @loan_proposal
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_loan_proposal
    @loan_proposal = Loan_proposal.find(params[:id])
  end

  def loan_proposal_params
    params.require(:loan_proposal).permit(:conditions, :amount, :accepted)
  end

end
