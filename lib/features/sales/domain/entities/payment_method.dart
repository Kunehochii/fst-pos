/// Payment methods supported by the POS system.
enum PaymentMethod {
  cash,
  bankTransfer,
  check;

  /// Convert from API string to enum.
  static PaymentMethod fromString(String value) {
    switch (value.toUpperCase()) {
      case 'BANK_TRANSFER':
        return PaymentMethod.bankTransfer;
      case 'CHECK':
        return PaymentMethod.check;
      default:
        return PaymentMethod.cash;
    }
  }

  /// Convert to API string format.
  String toApiString() {
    switch (this) {
      case PaymentMethod.cash:
        return 'CASH';
      case PaymentMethod.bankTransfer:
        return 'BANK_TRANSFER';
      case PaymentMethod.check:
        return 'CHECK';
    }
  }

  /// Get display name.
  String get displayName {
    switch (this) {
      case PaymentMethod.cash:
        return 'Cash';
      case PaymentMethod.bankTransfer:
        return 'Bank Transfer';
      case PaymentMethod.check:
        return 'Check';
    }
  }
}
