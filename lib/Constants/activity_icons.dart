
enum ActivityIcon {
  breakfast,
  calendar,
  code,
  exercise,
  finance,
  fruit,
  journal,
  language,
  meditation,
  photography,
  pushups,
  read,
  run,
  shower,
  sleep,
  steps,
  study,
  yoga,
  none
}

extension ActivityIconExtension on ActivityIcon {
  String get imagePath {
    String path = this.toString().substring(13) + '.png';
    return 'assets/images/activities/' + path;
  }
}