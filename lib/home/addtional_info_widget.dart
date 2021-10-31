import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:outside/base/presentation/shadow.dart';

class AdditionalInfoWidget extends StatelessWidget {
  late SvgPicture _icon;
  late String _text;

  AdditionalInfoWidget(SvgPicture icon, String text) {
    _icon = icon;
    _text = text;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            height: 56,
            width: 56,
            child: _icon,
            padding: new EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color.fromRGBO(241, 245, 251, 1.0),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [AppBoxShadow()],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              _text,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          )
        ],
      ),
    );
  }
}
