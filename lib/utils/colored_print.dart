/*
    Created by: Bakhromjon Polat
    Created at: Oct 06 2022 17:40:25

    Github: https://github.com/BahromjonPolat
    LinkedIn: https://linkedin.com/in/bahromjon-polat
    Telegram: https://t.me/BahromjonPolat

    Description: To print log on console

*/

extension Log on Object? {
  printf([String name = '']) {
    String text =
        '\x1B[94m$date: \x1B[93m${name.toUpperCase()} => \x1B[96m${toString()}\x1B[0m';
    print(text);
  }

  String get date {
    DateTime now = DateTime.now();
    return '${now.hour}:${now.minute}:${now.second}';
  }
}
