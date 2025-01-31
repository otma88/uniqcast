

extension DateTimeExtensions on DateTime {

  String get formattedHHmm =>
      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

}
