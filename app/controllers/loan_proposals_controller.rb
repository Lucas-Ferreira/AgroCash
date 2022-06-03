class LoanProposalsController < ApplicationController

  def new
    @loan_proposal = LoanProposal.new
    authorize @loan_proposal
  end

  def create
    @loan_proposal = LoanProposal.new(loan_proposal_params)
    @loan_proposal.user = current_user
    if @loan_proposal.save
      redirect_to loan_proposal_path(@loan_proposal), notice: "Proposta de empréstimo realizada com sucesso"
    else
      render :new
    end
    authorize @loan_proposal
  end



  def index
    @loan_proposals = policy_scope(LoanProposal)
  end

  def show

  end

  def edit
  end

  def update
    @loan_proposal.update(loan_proposal_params)
    redirect_to loan_proposal_path(@loan_proposal)
    authorize @loan_proposal

  end

  def destroy
  end

  private

  def set_loan_proposal
    @loan_proposal = Loan_proposal.find(params[:id])
  end

  def loan_proposal_params
    params.require(:loan_proposal).permit(:conditions, :amount, :accepted, :description)
  end

end
