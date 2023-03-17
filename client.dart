import 'bank_account.dart';

class Client{
  String name;
  String address;
  String phone;
  late BankAccount account;

  Client({required this.name,required this.address,required this.phone});

  void view(){
    print("Client name: $name has an address $address with phone $phone");
    account.view();
  }
}