import 'package:flutter/material.dart';

const _bsDefaultPadding = 16.0;

class BaseBottomSheetContent extends StatelessWidget {
  final Widget? child;

  const BaseBottomSheetContent({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: bottomPadding + _bsDefaultPadding,
          top: 48,
          left: _bsDefaultPadding,
          right: _bsDefaultPadding,
        ),
        child: child,
      ),
    );
  }
}
