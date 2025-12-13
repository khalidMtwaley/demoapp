import 'package:flutter/material.dart';
import '../../enum/cubit_state/cubit_state.dart';
import '../custom_loading/custom_loading.dart';
import '../exception_widget/exception_widget.dart';
import '../no_data_widget/no_data_widget.dart';

class ApiResponseWidget extends StatelessWidget {
  final CubitState cubitState;
  final Widget child;
  final double loadingSize;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final Widget? emptyWidget;
  final Widget? unauthorizedWidget;
  final Widget? offlineWidget;
  final bool isEmpty;
  final bool initialChild;
  final void Function()? onReload;
  final Axis axis;
  final String? noDataMessage;
  final String? exceptionMessage;
  final Color? loadingColor;
  const ApiResponseWidget({
    super.key,
    required this.cubitState,
    required this.child,
    required this.onReload,
    required this.isEmpty,
    this.loadingSize = 35,
    this.loadingWidget,
    this.axis = Axis.vertical,
    this.noDataMessage,
    this.exceptionMessage,
    this.errorWidget,
    this.emptyWidget,
    this.offlineWidget,
    this.loadingColor,
    this.unauthorizedWidget,
    this.initialChild = false,
  });

  @override
  Widget build(BuildContext context) {
    switch (cubitState) {
      case CubitState.initial:
        if (initialChild) {
          return child;
        } else {
          return const SizedBox();
        }
      case CubitState.loading:
        return loadingWidget ??
            Center(
              child: CustomLoading(
                size: loadingSize,
                color: loadingColor,
              ),
            );
      case CubitState.success:
     
        if (isEmpty) {
          return emptyWidget ??
              Center(
                child: NoDataWidget(
                  message: noDataMessage,
                  axis: axis,
                ),
              );
        } else {
          return child;
        }
      case CubitState.failure:
        return errorWidget ??
            Center(
              child: ExceptionWidget(
                message: exceptionMessage,
                axis: axis,
                onReload: onReload,
              ),
            );
     
   
    }
  }
}
