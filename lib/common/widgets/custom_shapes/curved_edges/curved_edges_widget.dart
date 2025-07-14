


import 'package:flutter/material.dart';

import 'curved_edges.dart';

class HkCurvedEdgesWidget extends StatelessWidget {
  const HkCurvedEdgesWidget({
    super.key, this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HkCustomCurvedEdges(),
      child: child,
    );
  }
}