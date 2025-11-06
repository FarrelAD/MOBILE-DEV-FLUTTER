import 'package:flutter/material.dart';
import 'package:week_10/models/data_layer.dart';

class PlanProvider extends InheritedNotifier<ValueNotifier<List<Plan>>> {
  const PlanProvider({
    required super.child,
    required ValueNotifier<List<Plan>> super.notifier,
    super.key,
  });

  static ValueNotifier<List<Plan>> of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<PlanProvider>()!
        .notifier!;
  }
}
