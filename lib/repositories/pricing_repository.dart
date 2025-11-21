class PricingRepository {
  final String currency;
  int _sandwiches = 0;
  bool _isFootlong = true;

  PricingRepository({required this.currency});

  double get price => _sandwiches * (_isFootlong ? 11.0 : 7.0);

  double getPrice(bool isFoootl, int sandws){
    return sandws * (isFoootl ? 11.0 : 7.0);
  }
  void setSandwiches(int sandwiches) {
    _sandwiches = sandwiches;
  }

  void setSize(bool isFootlong) {
    _isFootlong = isFootlong;
  }


}