import 'package:utc_time_zone_converter/src/time_zone.dart';
import 'package:utc_time_zone_converter/utc_time_zone_converter.dart';
import 'package:test/test.dart';

void main() {
  test('Parse UTC time zone name and convert DateTime', () {
    final timeZoneName = 'UTC+4';
    final timeZone = TimeZone(name: timeZoneName, offset: UtcOffsetParser(timeZoneName).parse());
    final dateTime = DateTime.utc(2024, 07, 07, 0, 0);
    expect(timeZone.toUtc(dateTime), DateTime.utc(2024, 07, 07, 4, 0));
  });

  group('TimeZone', () {
    test('Convert to UTC+5', () {
      final timeZone = TimeZone(name: 'UTC+5', offset: Duration(hours: 5));
      final dateTime = DateTime.utc(2024, 07, 07, 0, 0);
      expect(timeZone.toUtc(dateTime), DateTime.utc(2024, 07, 07, 5, 0));
    });

    test('Convert to UTC-7:30', () {
      final timeZone = TimeZone(name: 'UTC-7:30', offset: Duration(hours: -7, minutes: -30));
      final dateTime = DateTime.utc(2024, 07, 07, 0, 0);
      expect(timeZone.toUtc(dateTime), DateTime.utc(2024, 07, 06, 16, 30));
    });

    test('Convert to local UTC+11:30', () {
      final timeZone = TimeZone(name: 'UTC+11:30', offset: Duration(hours: 11, minutes: 30));
      final dateTime = DateTime(2024, 07, 07, 0, 0);
      expect(timeZone.toLocal(dateTime), DateTime(2024, 07, 07, 11, 30));
    });
  });

  group('UtcOffsetParser', () {
    test('Parse UTC+5', () {
      final parser = UtcOffsetParser('UTC+5');
      expect(parser.parse(), Duration(hours: 5));
    });
    test('Parse UTC+5:30', () {
      final parser = UtcOffsetParser('UTC+5:30');
      expect(parser.parse(), Duration(hours: 5, minutes: 30));
    });
    test('Parse UTC-12', () {
      final parser = UtcOffsetParser('UTC-12');
      expect(parser.parse(), Duration(hours: -12));
    });
    test('Parse UTC-7:20', () {
      final parser = UtcOffsetParser('UTC-7:20');
      expect(parser.parse(), Duration(hours: -7, minutes: -20));
    });

    test('Parse UTC+', () {
      final parser = UtcOffsetParser('UTC+');
      expect(() => parser.parse(), throwsA(isA<FormatException>()));
    });

    test('Parse "wrong format"', () {
      final parser = UtcOffsetParser('wrong format');
      expect(() => parser.parse(), throwsA(isA<FormatException>()));
    });

    test('Try parse "wrong format"', () {
      final parser = UtcOffsetParser('wrong format');
      expect(parser.tryParse(), equals(null));
    });
  });
}
