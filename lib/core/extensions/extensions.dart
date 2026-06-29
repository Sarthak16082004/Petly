import 'package:intl/intl.dart';

extension DateTimeFormatting on DateTime {
  String toDisplayDate() => DateFormat('MMM d, yyyy').format(this);
  String toDisplayDateTime() => DateFormat('MMM d, yyyy • h:mm a').format(this);
  String toDisplayTime() => DateFormat('h:mm a').format(this);
  String toDisplayMonthYear() => DateFormat('MMMM yyyy').format(this);
  String toDisplayShortDate() => DateFormat('MMM d').format(this);
  String toRelativeDate() {
    final now = DateTime.now();
    final diff = now.difference(this);
    if (diff.inDays == 0) return 'Today';
    if (diff.inDays == 1) return 'Yesterday';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return toDisplayDate();
  }

  String toAgeString() {
    final now = DateTime.now();
    int years = now.year - year;
    int months = now.month - month;
    if (months < 0) {
      years--;
      months += 12;
    }
    if (years > 0) return '$years yr${years > 1 ? 's' : ''}';
    if (months > 0) return '$months mo';
    final days = now.difference(this).inDays;
    return '$days day${days != 1 ? 's' : ''}';
  }

  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day;
  }

  bool get isPast => isBefore(DateTime.now());
  bool get isFuture => isAfter(DateTime.now());
}

extension StringExtensions on String {
  String get initials {
    final parts = trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '';
    if (parts.length == 1) {
      return parts.first.isEmpty ? '' : parts.first[0].toUpperCase();
    }
    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }

  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String? get nullIfEmpty => trim().isEmpty ? null : trim();
}

extension MoneyFormatting on int {
  /// Format minor currency units (e.g. 1050 → "₹10.50")
  String toMoneyString(String currencyCode) {
    final amount = this / 100.0;
    final symbol = _currencySymbol(currencyCode);
    return '$symbol${amount.toStringAsFixed(2)}';
  }

  String _currencySymbol(String code) {
    return switch (code.toUpperCase()) {
      'USD' => '\$',
      'EUR' => '€',
      'GBP' => '£',
      'INR' => '₹',
      'JPY' => '¥',
      'AUD' => 'A\$',
      'CAD' => 'C\$',
      _ => '$code ',
    };
  }
}

extension WeightFormatting on int {
  /// Format grams to display string (kg if >= 1000g)
  String toWeightDisplay(String unit) {
    if (unit == 'kg' || (unit == 'auto' && this >= 1000)) {
      final kg = this / 1000.0;
      return '${kg.toStringAsFixed(kg.truncate() == kg ? 0 : 2)} kg';
    }
    if (unit == 'lb' || unit == 'lbs') {
      final lb = this / 453.592;
      return '${lb.toStringAsFixed(1)} lb';
    }
    return '$this g';
  }
}
