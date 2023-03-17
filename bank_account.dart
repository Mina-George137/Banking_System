import 'client.dart';

class BankAccount{
  late int _accountID ;
  late double _balance ;
  static int idGenerator = 1 ;  ///Work as global variable to all accounts
  late Client owner;

  BankAccount({double balance =0}){
    _accountID = idGenerator ;
    idGenerator++ ;
    this._balance = balance;
  }

  int get accountID => _accountID;

  set accountID(int value) {
    _accountID = value;
  }

  double get balance => _balance;

  set balance(double value) {
    _balance = value;
  }

  bool withdraw(double amount){
    if(amount < 0){
      return false;
    }else if( amount > balance){
      return false;
    }
    balance -= amount;
    return true;
  }

  bool deposite(double amount){
    if(amount < 0){
      return false;
    }
    balance += amount;
    return true;
  }

  void view(){
    print("Bank Account ID: $accountID");
    print("Bank Account balance: $balance");
    // owner.view();
  }
}
