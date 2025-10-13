class BankAccount {
  // TODO
  final int _accountID;
  final String _accountName;
  final String _accountType;
  double _balance;

  BankAccount(
    this._accountID,
    this._accountName,
    this._accountType,
    this._balance,
  );

  double balance() => _balance;

  double withdraw(double amount) {
    if (amount <= 0) {
      print("Invaid amount. Must to greater than 0");
    } else if (amount > _balance) {
      throw Exception("Not engough balance to withdraw");
    } else {
      _balance -= amount;
      print("Withdraw: $amount");
    }
    return _balance;
  }

  void credit(double amount) {
    if (amount > 0) {
      _balance += amount;
    } else {
      print("invait amount");
    }
  }

  int get accountID => _accountID;
  String get accountName => _accountName;
  String get accountType => _accountType;
}

class Bank {
  // TODO
  final String bankName;
  final String location;
  final List<BankAccount> _accounts = [];

  Bank(this.bankName, this.location);

  BankAccount creatAccount(
    int accountId,
    String accountOwner,
    String accountType,
    double balance,
  ) {
    for (var acc in _accounts) {
      if (acc._accountID == accountId) {
        throw Exception("Account with this ID $accountId already exist");
      }
    }
    var newAccount = BankAccount(accountId, accountOwner, accountType, balance);
    _accounts.add(newAccount);
    return newAccount;
  }
}

void main() {
  Bank myBank = Bank("CADT Bank", "pp");
  BankAccount ronanAccount = myBank.creatAccount(1001, 'Ronan', 'credit', 0);
  // print("Balance: ${ronanAccount.balance()}");

  print("Balance: \$${ronanAccount.balance()}"); // Balance: $0
  ronanAccount.credit(100);
  print("Balance:\$${ronanAccount.balance()}"); // Balance: $100
  ronanAccount.withdraw(50);
  print("${ronanAccount.balance()}"); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.creatAccount(
      1001,
      'Honlgy',
      "savaing",
      1000,
    ); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
