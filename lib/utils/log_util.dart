class Log {
  static void logs(String title, String msg) {
    print('TAG:: $title :: $msg');
  }

  static void loga(String title, Object msg) {
    //print('TAG:: $title :: $msg');
    //
    // OR
    //
    final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern
        .allMatches(msg)
        .forEach((match) => print('TAG:: $title :: ' + match.group(0)));
  }

  static void logi(String title, int msg) {
    print('TAG:: $title :: $msg');
  }

  static printWrapped(String text) {
    final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }
}
