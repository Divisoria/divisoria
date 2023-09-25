import 'package:money_formatter/money_formatter.dart';

enum Currency { ph }

class CurrencyHelper {
  static String format({
    Currency currency = Currency.ph,
    required double amount,
  }) {
    final settings = MoneyFormatterSettings(
      symbol: '',
      fractionDigits: 3,
      compactFormatType: CompactFormatType.short,
    );

    switch (currency) {
      case Currency.ph:
        settings.symbol = '₱';
        return MoneyFormatter(
          amount: amount,
          settings: settings,
        ).output.symbolOnLeft;
    }
  }
}
