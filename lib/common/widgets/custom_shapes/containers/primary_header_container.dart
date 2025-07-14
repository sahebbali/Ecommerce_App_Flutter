


import 'package:flutter/cupertino.dart';

import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class HkPrimaryHeaderContainer extends StatelessWidget {

   const HkPrimaryHeaderContainer({
    super.key, required this.child,
  });
   final Widget child;
  @override
  Widget build(BuildContext context) {
    return HkCurvedEdgesWidget(
      child: Container(
        color: HkColors.primary,
        padding:  const EdgeInsets.all(0),
        child: Stack(
          children: [
            /// Background Custom Shapes
            Positioned(top: -150, right: -250, child: HkCircularContainer(backgroundColor: HkColors.textWhite.withOpacity(0.1),)),
            Positioned(top: 100, right: -300,child: HkCircularContainer(backgroundColor: HkColors.textWhite.withOpacity(0.1),)),
            child
          ],
        ),
      ),
    );
  }
}