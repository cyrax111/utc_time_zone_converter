import 'offset_parser.dart';

class UtcOffsetParser implements OffsetParser {
  const UtcOffsetParser(this.toParse);
  final String toParse;
  @override
  Duration parse() {
    RegExp exp = RegExp(r'^.*UTC([+-])(\d{1,2}):?(\d{0,2})');
    final match = exp.firstMatch(toParse);
    if (match == null) {
      throw FormatException('UTC offset not found');
    }
    final symbolStr = match[1];
    final hoursStr = match[2];
    final minutesStr = match[3];
    if (symbolStr == null) {
      throw FormatException('"+" or "-" symbol not found');
    }
    if (hoursStr == null) {
      throw FormatException('offset hours not found');
    }

    final symbol = symbolStr == '-' ? -1 : 1;
    final hours = symbol * int.parse(hoursStr);
    final minutes = minutesStr == null || minutesStr.isEmpty ? 0 : symbol * int.parse(minutesStr);

    return Duration(hours: hours, minutes: minutes);
  }

  @override
  Duration? tryParse() {
    try {
      return parse();
    } on FormatException {
      return null;
    }
  }
}
