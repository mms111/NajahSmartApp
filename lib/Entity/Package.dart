class Package {

  String _title;
  String _validity;
  double _price;

  Package(this._title, this._validity, this._price);
  Package.customConstructor();

  void setTitle(String title)
  {
    _title = title;
  }

  void setValidity(String validity)
  {
    _validity = validity;
  }

  void setPrice(double price)
  {
    _price = price;
  }

  get title => _title;
  get validity => _validity;
  get price => _price;
  
}