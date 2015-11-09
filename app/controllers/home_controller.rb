class HomeController < ApplicationController
  def save_email
    LogMailer.log_email("@#{params[:email]} #{params[:vote]}")
    redirect_to statement_path(brexit)
  end

  private

  def brexit
    Statement.find(7)
  end
end