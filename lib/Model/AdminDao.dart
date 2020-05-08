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
}