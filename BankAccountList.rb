require './BankAccount.rb'

class BankAccountList
  @found_user = false
  @found_user_info = {}
  def initialize
    @bank_list = []
  end

  def add_to_list(object)
    @bank_list.push(object)
  end

  def get_user_account(user_name)
    find_user_info(user_name)
    if(@found_user == true)
      puts "found user #{@found_user_info}"
      puts ""
    else
      @found_user = false
      puts "didn't find #{user_name}"
    end
  end

  def get_checking
    if(@found_user == true)
      puts "amount in #{@found_user_info["user_name"]}'s' checking account is #{@found_user_info["checking"]}"
    else
      puts "didn't find #{user_name} checking account"
    end
  end

  def get_savings
    if(@found_user == true)
      puts "amount in #{@found_user_info["user_name"]}'s savings account is #{@found_user_info["savings"]} account"
    else
      puts "didn't find users checking account"
    end

  end

  def get_amount_of_accounts
    puts ""
    puts "there are #{@bank_list.length} accounts in this bank"
  end

  def account_information
    if(@found_user == true)
      interest_rate(@found_user_info)
      puts "amount in #{@found_user_info["user_name"]}'s savings account is #{@found_user_info["savings"]} account"
      puts "amount in #{@found_user_info["user_name"]}'s checking account is #{@found_user_info["checking"]} account"
      puts "amount in #{@found_user_info["user_name"]}'s total account is #{@found_user_info["total"]} account"
    else
      puts "didn't find user"
    end
  end

  def withdraw_or_deposit_cash(amount_to_change, choice, account_to_change)
    if(@found_user == true)

      # Checking the choice of the user

      if(choice == 'deposit')

        # Changing the account the user chose
        if(account_to_change == "savings")
          @found_user_info["savings"] += amount_to_change
          puts ""
          puts "after depositing your #{account_to_change} account is as follows: "
          self.get_savings
        elsif(account_to_change == "checking")
          @found_user_info["checking"] += amount_to_change
          puts ""
          puts "after depositing your #{account_to_change} account is as follows: "
          self.get_checking
        end

      elsif(choice == "withdraw")

        if(@found_user_info[account_to_change]>0)
          @found_user_info["checking"] += amount_to_change
          @found_user_info["savings"] -= amount_to_change
        elsif(@found_user_info[account_to_change] <= 0)
          puts 'you have an insufficient funds'
        end
        puts ""
        puts "after withdrawing your account amounts are as follows: "
        self.get_savings
        self.get_checking
      end

    else
      puts "didn't find users account"
    end
  end

  private
  attr_reader :interest_rate_val
  def find_user_info(account_name)
    @bank_list.map {|user_index|
      if(user_index.user_name == account_name)
        @found_user = true
        @found_user_info = {
          "user_id" => user_index.user_id,
          "user_name" => user_index.user_name,
          "savings" => user_index.savings_account,
          "checking" => user_index.checking_account,
          "total" => (user_index.savings_account + user_index.checking_account)
        }
      end
    }
  end

  def interest_rate(account_to_change)
    interest_rate_val = 0.05
    account_to_change["checking"] += (account_to_change["checking"]*interest_rate_val)
    account_to_change["saving"] += (account_to_change["savings"]*interest_rate_val)
    account_to_change["total"] += (account_to_change["total"]*interest_rate_val)
  end

end

bankList = BankAccountList.new
alex_account = BankAccount.new("Alex", 2000, 1000)
ray_account = BankAccount.new("Ray", 3000, 1000)
ally_account = BankAccount.new("Ally", 5000, 2000)
marc_account = BankAccount.new("Marc", 30000, 10000)
bankList.add_to_list(alex_account)
bankList.add_to_list(ray_account)
bankList.add_to_list(ally_account)
bankList.add_to_list(marc_account)
bankList.get_user_account(alex_account.user_name)
bankList.withdraw_or_deposit_cash(200, "deposit", "savings")
bankList.withdraw_or_deposit_cash(200, "deposit", "savings")
bankList.withdraw_or_deposit_cash(200, "withdraw", "savings")
bankList.get_amount_of_accounts


