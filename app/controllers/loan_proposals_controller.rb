class LoanProposalsController < ApplicationController
  before_action :set_loan_proposal, only: [:show, :edit, :update, :destroy]

  def new
    @loan_proposal = LoanProposal.new
    authorize @loan_proposal
  end

  def create
    @loan_proposal = LoanProposal.new(loan_proposal_params)
    @loan_proposal.user = current_user
    @loan_proposal.accepted = "Enviado"
    if @loan_proposal.save
      redirect_to loan_proposal_path(@loan_proposal), notice: "Proposta de empréstimo realizada com sucesso"
    else
      render :new
    end
    authorize @loan_proposal
  end

  def accept
    @loan_proposal = LoanProposal.find(params[:id])
    @loan_proposal.accepted = 'Aceito'
    @loan_proposal.save
    redirect_to user_profile_path, notice: "Proposta aceita com sucesso!"
    authorize @loan_proposal
  end

  def index
    @loan_proposals = policy_scope(LoanProposal)
  end

  def show
    authorize @loan_proposal
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
    @loan_proposal = LoanProposal.find(params[:id])
  end

  def loan_proposal_params
    params.require(:loan_proposal).permit(:conditions, :amount, :accepted, :description)
  end

end
