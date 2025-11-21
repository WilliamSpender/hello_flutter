class PricingRepository {
  final String currency;

  PricingRepository({required this.currency});

  double getPrice(bool isFoootl, int sandws) {
    return sandws * (isFoootl ? 11.0 : 7.0);
  }
}
