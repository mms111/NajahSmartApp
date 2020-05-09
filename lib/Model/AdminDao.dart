import 'package:najah_smartapp/Entity/Customer.dart';
import 'package:najah_smartapp/Model/MockData.dart';
import 'package:najah_smartapp/Entity/Admin.dart';

class AdminDao{

  
  bool validateAdmin(Admin _admin)
  {
    
    if(_admin.email == admin.email && _admin.password == admin.password)
    {
      _admin.setName(admin.name);
      _admin.setProfilePic(admin.profilePicture);
      return true;
    }
      
    return false;

  }

  bool findAdmin(String email)
  {
    if(admin.email == email)
    {
      return true;
    }
    return false;
  }

  void addUser(Customer customer)
  {
    customersList.add(customer);
  }

  void deleteUser(Customer customer)
  {
    customersList.remove(customer);
  }

  Customer findUser(String email)
  {
    for(int i=0; i<customersList.length; i++)
    {
      if(customersList[i].email == email)
      {
        Customer customer = Customer.customConstructor();
        customer.setEmail(customersList[i].email);
        customer.setName(customersList[i].name);
        customer.setProfilePic(customersList[i].profilePicture);
        customer.setPhone(customersList[i].phone);
        customer.setCredit(customersList[i].credit);
        return customer;
      }
       
    }

    return null;
  }

  
}