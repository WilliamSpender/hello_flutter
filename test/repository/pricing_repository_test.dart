import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

void main() {
  group('PricingRepository', () {
    test('Price should be 0 with no sandwiches', () {
      final repository = PricingRepository(currency: "£");
      expect(repository.getPrice(false,0), 0);
    });

  test('Price should be 11 for 1 footlong', () {
      final repository = PricingRepository(currency: "£");
      expect(repository.getPrice(true, 1), 11);
    });

  test('Price should be 7 for 1 6-inch', () {
      final repository = PricingRepository(currency: "£");
      expect(repository.getPrice(false, 1), 7);
    });
}