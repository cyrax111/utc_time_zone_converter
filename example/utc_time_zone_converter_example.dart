import 'package:utc_time_zone_converter/utc_time_zone_converter.dart';

void main() {
  // Name of time zone
  final fetchedTimeZoneNameFromDB = 'UTC+4';
  // Parsing timezone to get offset
  final timeZoneOffset = UtcOffsetParser(fetchedTimeZoneNameFromDB).parse();
  // Creating time zone
  final timeZone = TimeZone(name: fetchedTimeZoneNameFromDB, offset: timeZoneOffset);

  // Time to convert
  var dateTimeToConvertToTimeZone = DateTime.utc(2024, 07, 07, 0, 0);
  // Convert time through offsetting with [timeZoneOffset]
  final convertedUtcDateTime = dateTimeToConvertToTimeZone.toTimeZone(timeZone);
  print(convertedUtcDateTime); // 2024-07-07 04:00:00.000Z
}
