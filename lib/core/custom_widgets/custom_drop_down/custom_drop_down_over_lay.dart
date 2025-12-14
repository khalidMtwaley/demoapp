import 'package:demoapp/core/custom_widgets/custom_form_field/custom_form_field.dart';
import 'package:demoapp/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomDropdownOverlay extends StatefulWidget {
  final List<CustomSelectDropdownItem> items;
  final String? title;
  final String? requiredTitle;
  final String? hintText;
  final String? titleIcon;
  final Function(dynamic) onItemSelected;
  final double? height;
  final Widget? prefixIcon;
  final bool isLoading;
  final String? Function(String?)? validator;
  final String? selectedItem;
  final Color borderColor;
  final double borderRadius;

  const CustomDropdownOverlay({
    super.key,
    required this.items,
    this.title,
    this.requiredTitle,
    this.hintText,
    required this.onItemSelected,
    this.height,
    this.prefixIcon,
    this.titleIcon,
    this.isLoading = false,
    this.validator,
    this.selectedItem,
    this.borderColor = const Color(0xffe8eef4),
    this.borderRadius = 16,
  });

  @override
  State<CustomDropdownOverlay> createState() => _CustomDropdownOverlayState();
}

class _CustomDropdownOverlayState extends State<CustomDropdownOverlay> {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  final _selectedItemEc = TextEditingController();
  final ValueNotifier<bool> _isDropdownVisible = ValueNotifier<bool>(false);
  final ScrollController scrollController = ScrollController();

  dynamic selectedValue;

  @override
  void initState() {
    super.initState();
    if (widget.selectedItem != null &&
        widget.selectedItem!.isNotEmpty &&
        widget.items.isNotEmpty) {
      _selectedItemEc.text = widget.selectedItem!;
      final item = widget.items.firstWhere(
        (item) => item.name == widget.selectedItem,
        orElse: () => widget.items.isNotEmpty
            ? widget.items.first
            : CustomSelectDropdownItem(value: null, name: ''),
      );
      selectedValue = item.value;
    }
  }

  @override
  void didUpdateWidget(CustomDropdownOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedItem == "clear") {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _selectedItemEc.clear();
        selectedValue = null;
      });
    }
  }

  void _showOverlay(BuildContext context) {
    final renderBox = context.findRenderObject() as RenderBox?;
    final size = renderBox?.size;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients && selectedValue != null) {
        final selectedIndex = widget.items.indexWhere(
          (item) => item.value == selectedValue,
        );

        if (selectedIndex != -1) {
          final itemHeight = 42.0;
          final scrollOffset = selectedIndex * itemHeight;
          final maxHeight = widget.height ?? 180.h;

          final centerOffset =
              scrollOffset - (maxHeight / 2) + (itemHeight / 2);

          scrollController.jumpTo(
            centerOffset.clamp(
              0.0,
              scrollController.position.maxScrollExtent,
            ),
          );
        }
      }
    });

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            _isDropdownVisible.value = false;
            _removeOverlay();
          },
          behavior: HitTestBehavior.opaque,
          child: Stack(
            children: [
              Positioned.fill(child: Container(color: Colors.transparent)),
              Positioned(
                width: size?.width ?? 200.w,
                child: CompositedTransformFollower(
                  link: _layerLink,
                  showWhenUnlinked: false,
                  offset: Offset(0, (size?.height ?? 60.h)),
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: widget.borderColor),
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      constraints: BoxConstraints(
                        maxHeight: widget.height ?? 180.h,
                      ),
                      child: widget.items.isEmpty
                          ? const Center(
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text("no data"),
                              ),
                            )
                          : RawScrollbar(
                              controller: scrollController,
                              thumbVisibility: true,
                              thickness: 3,
                              radius: Radius.circular(12),
                              padding: EdgeInsets.only(top: 4.h, bottom: 4.h),
                              child: ListView.builder(
                                controller: scrollController,
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: widget.items.length,
                                itemBuilder: (context, index) {
                                  final isSelected = selectedValue ==
                                      widget.items[index].value;

                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        _selectedItemEc.text =
                                            widget.items[index].name;
                                        selectedValue =
                                            widget.items[index].value;
                                      });

                                      widget.onItemSelected(
                                          widget.items[index].value);

                                      _isDropdownVisible.value = false;
                                      _removeOverlay();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? AppColor.mainAppColor(context)
                                                .withOpacity(0.08)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.only(
                                          topLeft: index == 0
                                              ? Radius.circular(14)
                                              : Radius.zero,
                                          topRight: index == 0
                                              ? Radius.circular(14)
                                              : Radius.zero,
                                          bottomLeft:
                                              index == widget.items.length - 1
                                                  ? Radius.circular(14)
                                                  : Radius.zero,
                                          bottomRight:
                                              index == widget.items.length - 1
                                                  ? Radius.circular(14)
                                                  : Radius.zero,
                                        ),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10.h,
                                        horizontal: 12.w,
                                      ),
                                      // color: isSelected
                                      //     ? AppColors.mainAppColor(context)
                                      //         .withOpacity(0.08)
                                      //     : Colors.transparent,
                                      child: Text(
                                        widget.items[index].name,
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: isSelected
                                              ? FontWeight.w600
                                              : FontWeight.w400,
                                          color: isSelected
                                              ? AppColor.mainAppColor(context)
                                              : AppColor.blackColor(context),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    scrollController.dispose();
    _removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: CustomFormField(
        readOnly: true,
        onTap: () {
          if (_overlayEntry == null) {
            if (!widget.isLoading) {
              _showOverlay(context);
              _isDropdownVisible.value = true;
            }
          } else {
            _isDropdownVisible.value = false;
            _removeOverlay();
          }
        },
        validator: widget.validator,
      
        title: widget.title,
        hintText: widget.hintText,
        controller: _selectedItemEc,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isLoading
            ? const CupertinoActivityIndicator()
            : ValueListenableBuilder(
                valueListenable: _isDropdownVisible,
                builder: (context, value, _) => Icon(
                  value ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  size: 24,
                ),
              ),
      ),
    );
  }
}

class CustomSelectDropdownItem {
  final dynamic value;
  final String name;

  CustomSelectDropdownItem({
    required this.value,
    required this.name,
  });
}
