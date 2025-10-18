class Duration {
  final int _milliseconds;
  const Duration._(this._milliseconds);

  Duration.fromHours(int hours) : _milliseconds = hours * 60 * 60 * 1000;
  Duration.fromMinutes(int minutes) : _milliseconds = minutes * 60 * 1000;
  Duration.fromSeconds(int seconds) : _milliseconds = seconds * 1000;

  Duration operator +(Duration other) {
    return Duration._(_milliseconds + other._milliseconds);
  }

  Duration operator -(Duration other) {
    int result = _milliseconds - other._milliseconds;
    if (result < 0) result = 0;
    return Duration._(result);
  }

  bool operator >(Duration other) {
    return _milliseconds > other._milliseconds;
  }

  bool operator <(Duration other) {
    return _milliseconds < other._milliseconds;
  }
   @override
  String toString() => "${_milliseconds} ms";
}
main(){
   var d1 = Duration.fromMinutes(5);
  var d2 = Duration.fromSeconds(90);

  var sum = d1 + d2;
  var diff = d1 - d2;

  print("d1: $d1"); // 300s (300000ms)
  print("d2: $d2"); // 90s (90000ms)
  print("Sum: $sum"); // 390s (390000ms)
  print("Diff: $diff"); // 210s (210000ms)

  print("d1 > d2? ${d1 > d2}"); // true
}