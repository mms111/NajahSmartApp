import 'package:najah_smartapp/Entity/Package.dart';
import 'package:najah_smartapp/Model/MockData.dart';

class PackageDao {

  bool findPackage(String title)
  {
    for(int i=0; i<packagesList.length; i++)
    {
      if(packagesList[i].title == title.toUpperCase())
      {
        return true;
      }
    }
    return false;
  }

  void addPackage(Package package)
  {
    packagesList.add(package);
  }

  List<Package> packageList()
  {
    return packagesList;
  }

  void deletePackage(Package package)
  {
    packagesList.remove(package);
  }
  
}