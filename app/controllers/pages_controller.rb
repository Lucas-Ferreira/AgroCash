class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def profile
    @user = current_user
    @address = Address.new
    @loan_proposals = LoanProposal.all
  end
 #comentario
end
