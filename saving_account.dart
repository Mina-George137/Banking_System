import 'bank_account.dart';

class SavingBankAccount extends BankAccount{
  double minimumBalance ;
  SavingBankAccount({this.minimumBalance=1000 , required double balance}):super(balance: balance);

  @override
  bool withdraw(double amount) {
    if(balance-amount < minimumBalance){
      return false;
    }
    return super.withdraw(amount);
  }

  @override
  bool deposite(double amount) {
    // TODO: implement deposite
    return super.deposite(amount);
  }
  @override
  void view() {
    // TODO: implement view
    print("Minimum balance $minimumBalance");
    super.view();

  }
}