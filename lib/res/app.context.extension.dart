import 'package:bike_shopping/res/resources.dart';
import 'package:flutter/material.dart';

extension AppContextExtension on BuildContext {
  Resources get resources => Resources.of(this);
}
