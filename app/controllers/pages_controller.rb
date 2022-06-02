class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def profile
    @user = current_user
    @address = Address.new
  end

  def status
    raise
    @loan_proposal = LoanProposal.find(params[id])
  end
end
