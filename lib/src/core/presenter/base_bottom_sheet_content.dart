import 'package:flutter/material.dart';

const _bsDefaultPadding = 16.0;

class BaseBottomSheetContent extends StatelessWidget {
  final Widget? child;

  const BaseBottomSheetContent({Key? key, this.child}) : super(key: key);

  // EdgeInsets.symmetric(vertical: 16, horizontal: 16)
  @override
  Widget build(BuildContext context) {
    var bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: bottomPadding + _bsDefaultPadding,
          top: _bsDefaultPadding,
          left: _bsDefaultPadding,
          right: _bsDefaultPadding,
        ),
        child: child,
      ),
    );
  }
}
