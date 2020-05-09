import 'package:najah_smartapp/Entity/Customer.dart';
import 'package:najah_smartapp/Entity/TopUp.dart';
import 'MockData.dart';

class TopUpDao {
  
  void updateUserAmount(Customer customer, double amount)
  {
     for(int i=0; i<customersList.length; i++)
    {
      if(customersList[i].email == customer.email)
      {
        customersList[i].setCredit((customer.credit+amount));
        TopUp topUp = new TopUp(customer, DateTime.now(), amount);
        topUpList.add(topUp);
      }
       
    }
  }
}