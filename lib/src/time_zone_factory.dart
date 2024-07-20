import 'offset_parser/utc_offset_parser.dart';
import 'time_zone.dart';

abstract class TimeZoneFactory {
  TimeZone get timezone;
}

/// Trow exception
class UtcTimeZoneFactory implements TimeZoneFactory {
  UtcTimeZoneFactory(String timezoneName) {
    final timezoneOffset = UtcOffsetParser(timezoneName).parse();
    timezone = TimeZone(name: timezoneName, offset: timezoneOffset);
  }

  @override
  late final TimeZone timezone;
}
