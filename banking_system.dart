import 'dart:io';

import 'client.dart';
import 'bank_account.dart';
import 'saving_account.dart';

class BankingSystem{
  late List<BankAccount> accounts;
  late List<Client> clients;

  BankingSystem(){
    accounts = [];
    clients = [];
    addTestData();
  }

  void addTestData(){
    for(int i = 1 ; i <= 20 ; i++){
      Client client = Client(name: 'Client$i', address: 'address', phone: 'phone');
      BankAccount account1 = BankAccount(balance: i*10000.0);

      client.account = account1;
      account1.owner = client;

      accounts.add(account1);
      clients.add(client);
    }
  }
  void printAllAccounts(){
    for(int i = 0 ; i < clients.length ; i++){
      clients[i].view();
      print('======================');
    }
  }
  int searchByAccountId(int id){
    for(int i = 0 ; i < accounts.length ; i++){
      if(id == accounts[i].accountID){
        return i;
      }
    }
    return -1;
  }
  void showAccountDetails(){
    print('Enter the accountID: ');
    var id = int.parse(stdin.readLineSync()!);
    int index = searchByAccountId(id);
    if(index != -1){
      accounts[index].owner.view();
    }else{
      stderr.write("Invalid ID, Account not found\n");
    }

  }
  void deleteAccount(){
    print('Enter the accountID: ');
    var id = int.parse(stdin.readLineSync()!);
    int index = searchByAccountId(id);

    if(index != -1){

     accounts.remove(accounts[index]);
     clients.remove(clients[index]);
    print("Account deleted Successfully");
    }else{
      stderr.write("Invalid ID, Account not found\n");
    }
  }
  void withdraw(){
    print('Enter the accountID: ');
    var id = int.parse(stdin.readLineSync()!);
    int index = searchByAccountId(id);
    if(index != -1){
      print('Please enter amount: ');
      double amount = double.parse(stdin.readLineSync()!);
      if( accounts[index].withdraw(amount) == true){
        print('Successful transaction');
      }
    }else{
      stderr.write("Invalid ID, Account not found\n");
    }
  }
  void deposit(){
    print('Enter the accountID: ');
    var id = int.parse(stdin.readLineSync()!);
    int index = searchByAccountId(id);
    if(index != -1){
      print('Please enter amount: ');
      double amount = double.parse(stdin.readLineSync()!);
      if( accounts[index].deposite(amount) == true){
        print('Successful transaction');
      }
    }else{
      stderr.write("Invalid ID, Account not found\n");
    }
  }
  void createAccount(){
    print('Please enter name: ');
    String name = stdin.readLineSync()!;
    print('Please enter address: ');
    String address = stdin.readLineSync()!;
    print('Please enter phone: ');
    String phone = stdin.readLineSync()!;

    Client client = Client(name: name, address: address, phone: phone);

    print('Please enter balance: ');
    double initialBalance = double.parse(stdin.readLineSync()!);

    print('Please enter account type:\n 1-Bank Account\n 2- Saving account');
    int type = int.parse(stdin.readLineSync()!);
    late BankAccount bankAccount;
    if(type == 1){
      bankAccount = BankAccount(balance: initialBalance);
    }else if(type == 1){
      bankAccount = SavingBankAccount(balance: initialBalance);
    }

    client.account = bankAccount;
    bankAccount.owner = client;

    clients.add(client);
    accounts.add(bankAccount);
    print('Created account successfully');

  }
  void showMenu(){
    while(true){
      print("1- Create account");
      print("2- Show all accounts");
      print("3- show accounts details");
      print("4- Delete account");
      print("5- Withdraw");
      print("6- Deposit");
      print("7- Exit");
      print("Enter choice number: ");
      int input = int.parse(stdin.readLineSync()!);

      if(input == 1){
          createAccount();
      }else if(input == 2){
          printAllAccounts();
      }else if(input == 3){
          showAccountDetails();
      }else if(input == 4){
          deleteAccount();
      }else if(input == 5){
          withdraw();
      }else if(input == 6){
          deposit();
      }else if(input == 7){
          return;
      }

      }
    }
  }
