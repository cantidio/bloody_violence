import 'package:start/start.dart';
import 'package:logging/logging.dart';

main() {
  Logger.root.level = Level.ALL;
  start(host: '0.0.0.0', port: 8080).then((Server app) {
    app.static('../build/web');
  });
}