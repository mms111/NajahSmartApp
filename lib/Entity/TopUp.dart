import 'package:cloud_firestore/cloud_firestore.dart';

class TopUp{

  Timestamp _date;
  String _customerName;
  String _customerId;
  double _amount;

  TopUp(this._date, this._customerId, this._customerName, this._amount);

  TopUp.customConstructor();

  Map<String, dynamic> toJson() =>
  {'date' : _date, 'customerId': _customerId, 'customerName': _customerName, 'amount' : _amount};

   void fromFirebase(DocumentSnapshot data)
  {
    this._date = data['date'];
    this._customerId = data['customerId'];
    this._customerName = data['customerName'];
    this._amount = data['amount'];
  }


  void setCustomerName(String customer)
  {
    _customerName = customer;
  }

  void setCustomerId(String id)
  {
    _customerId = id;
  }

  void setDate(Timestamp date)
  {
    _date = date;
  }

  void setAmount(double amount)
  {
    _amount = amount;
  }

  Timestamp getDate()
  {
    return _date;
  }

  String getCustomerName()
  {
    return _customerName;
  }

  String getCustomerId()
  {
    return _customerId;
  }

  double getAmount()
  {
    return _amount;
  }
  

}