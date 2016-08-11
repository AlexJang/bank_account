class BankAccount

  attr_accessor :user_name, :checking_account, :user_id, :savings_account

  def initialize(name, checking, savings)
    @user_name = name
    @user_id = get_account_number
    @checking_account = checking
    @savings_account = savings
  end

  private
  def get_account_number
    user_account_number = rand(1..1000)
    user_account_number
  end
end
