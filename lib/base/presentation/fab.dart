import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:outside/base/presentation/shadow.dart';

class FabButton extends StatelessWidget {
  late SvgPicture _icon;

  FabButton(SvgPicture icon) {
    _icon = icon;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ConstrainedBox(
        constraints: BoxConstraints.tight(
          Size(56, 56),
        ),
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: <Widget>[
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [AppBoxShadow()],
              ),
            ),
            Positioned(
              width: 24,
              height: 24,
              top: 16,
              left: 16,
              child: _icon,
            ),
            Positioned(
              top: 14,
              right: 14,
              child: CircleAvatar(
                radius: 6,
                backgroundColor: Color.fromRGBO(88, 150, 253, 1.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
