class AdminController < ApplicationController
  before_action :can_access?

  def accounts
    @accounts = Account.where(admin: false)
  end

  private

  def can_access?
    @show_sidebar = true

    if account_signed_in?
      unless current_account.admin?
        redirect_to root_url, flash: { danger: "You do not have access to view this page" } and return
      end
    else
      redirect_to new_account_session_path, flash: { danger: "You need to be logged in."} and return
    end
  end
end
