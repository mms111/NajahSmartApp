import 'package:najah_smartapp/Entity/Customer.dart';

class TopUp{

  Customer _customer;
  DateTime _date;
  double _amount;

  TopUp(this._customer, this._date, this._amount);

  void setCustomer(Customer customer)
  {
    _customer = customer;
  }

  void setDate(DateTime date)
  {
    _date = date;
  }

  void setAmount(double amount)
  {
    _amount = amount;
  }

  Customer getCustomer()
  {
    return _customer;
  }
  

  DateTime getDate()
  {
    return _date;
  }

  get amount => _amount;

}