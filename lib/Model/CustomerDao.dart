import 'package:najah_smartapp/Model/MockData.dart';
import 'package:najah_smartapp/Entity/Customer.dart';

class CustomerDao{

  
  bool validateCustomer(Customer customer)
  {
    for(int i=0; i<customersList.length; i++)
    {
      if(customersList[i].email == customer.email && customersList[i].password == customer.password)
      {
        customer.setName(customersList[i].name);
        customer.setProfilePic(customersList[i].profilePicture);
        customer.setPhone(customersList[i].phone);
        customer.setCredit(customersList[i].credit);
        return true;
      }
       
    }
    
    return false;
  }

  bool findCustomer(String email)
  {
    for(int i=0; i<customersList.length; i++)
    {
      if(customersList[i].email==email)
      {
        return true;
      }
    }
    return false;
  }

  void addCustomer(Customer customer)
  {
    customersList.add(customer);
  }

  List<Customer> customerList()
  {
    return customersList;
  }

  void deleteCustomer(Customer customer)
  {
    customersList.remove(customer);
  }

  Customer getCustomer(String email)
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