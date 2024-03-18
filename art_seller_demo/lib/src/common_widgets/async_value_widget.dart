import 'package:art_seller_demo/src/common_widgets/error_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({Key? key, required this.value, required this.data, this.loading})
      : super(key: key);
  final AsyncValue<T> value;
  final Widget Function(T) data;
  final Widget? loading;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: (e, st) => Center(child: ErrorMessageWidget(e.toString())),
      loading: () => loading ?? const Center(child: CircularProgressIndicator()),
    );
  }
}