class TimeZone {
  TimeZone({required this.name, required this.offset});

  final String name;
  final Duration offset;

  @override
  bool operator ==(Object other) {
    if (other is TimeZone && other.name == name && other.offset == offset) {
      return true;
    }
    return false;
  }

  @override
  int get hashCode => Object.hashAll([name, offset]);
}
