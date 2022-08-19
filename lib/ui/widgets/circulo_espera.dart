import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_shop/ui/estilos/cores.dart';

class CirculoEspera {
  static Widget criar({double? h, double? w, required Color cor}) {
    return Center(
      child: Container(
        height: h,
        width: w,
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(cor),
          strokeWidth: 5.0,
        ),
      ),
    );
  }
}
