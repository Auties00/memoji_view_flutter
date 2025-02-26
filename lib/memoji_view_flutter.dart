
import 'package:flutter/services.dart';

const _methodChannel = MethodChannel('memoji_view_flutter');

Future<Uint8List?> pickMemoji() => _methodChannel.invokeMethod('pickMemoji');