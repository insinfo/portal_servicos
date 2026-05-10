// ignore_for_file: uri_has_not_been_generated

import 'package:ngdart/angular.dart';

import 'package:portal_sali/src/app/app_component.template.dart' as ng;
import 'package:portal_sali/src/shared/di.dart';

void main() {
  runApp(
    ng.AppComponentNgFactory,
    createInjector: injector,
  );
}
