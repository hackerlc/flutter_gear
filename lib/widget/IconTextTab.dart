import 'package:flutter/material.dart';

const double _kIconTextTabHeight = 52.0; // 控件高度
const double _kIconAndTextMargin = 4.0; // 文字与图片间隔
const double _kIconWidth = 30.0;
const double _kIconHeight = 30.0;

// 上面图片下面文字的widget
// 因为这个widget 需要改变状态所以使用 StatefulWidget
class IconTextTab extends StatefulWidget {
  const IconTextTab({
    Key key,
    this.text,
    this.icon,
    this.color
}) : assert(text != null || icon != null || color != null),
  super(key: key);

  final String text;
  final String icon;
  final Color color;

  @override
  State<StatefulWidget> createState() {
    return IconTextState();
  }

}

class IconTextState extends State<IconTextTab>{

  Widget _buildLabelText(){
    return Text(widget.text,
      softWrap: false,
      overflow: TextOverflow.fade,
      style: TextStyle(
        color: widget.color
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));

    double height = _kIconTextTabHeight;
    Widget label = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Image(
            image: AssetImage(widget.icon),
            width: _kIconWidth,
            height: _kIconHeight,
          ),
          margin: const EdgeInsets.only(bottom: _kIconAndTextMargin),
        ),
        _buildLabelText() // 文字
      ],
    );

    return SizedBox(
      height: height,
      child: Center(
        child: label,
        widthFactor: 1.0,
      ),
    );
  }

}