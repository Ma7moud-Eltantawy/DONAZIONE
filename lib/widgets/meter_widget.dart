import 'dart:math' as math;
import 'package:flutter/material.dart';
// source [https://github.com/ltdangkhoa/Flutter-Speedometer];

class MeterWidget extends StatefulWidget {
  const MeterWidget({super.key,
        this.size = 200,
        this.minValue = 0,
        this.maxValue = 100,
        this.currentValue = 0,
        this.warningValue = 80,
        this.backgroundColor = Colors.transparent,
        this.meterColor = Colors.lightGreenAccent,
        this.warningColor = Colors.redAccent,
        this.kimColor = Colors.white,
        this.displayNumericStyle,
        this.displayText = '',
        this.displayTextStyle});
  final double size;
  final int minValue;
  final int maxValue;
  final int currentValue;
  final int warningValue;
  final Color backgroundColor;
  final Color meterColor;
  final Color warningColor;
  final Color kimColor;
  final TextStyle? displayNumericStyle;
  final String displayText;
  final TextStyle? displayTextStyle;

  @override
  MeterWidgetState createState() => MeterWidgetState();
}

class MeterWidgetState extends State<MeterWidget> {
  @override
  Widget build(BuildContext context) {
    double size = widget.size;
    int minValue = widget.minValue;
    int maxValue = widget.maxValue;
    int currentValue = widget.currentValue;
    int warningValue = widget.warningValue;
    double startAngle = 3.0;
    double endAngle = 21.0;

    double kimAngle = 0;
    if (minValue <= currentValue && currentValue <= maxValue) {
      kimAngle = (((currentValue - minValue) * (endAngle - startAngle)) /
          (maxValue - minValue)) +
          startAngle;
    } else if (currentValue < minValue) {
      kimAngle = startAngle;
    } else if (currentValue > maxValue) {
      kimAngle = endAngle;
    }

    double startAngle2 = 0.0;
    double endAngle2 = 18.0;
    double warningAngle = endAngle2;
    if (minValue <= warningValue && warningValue <= maxValue) {
      warningAngle =
          (((warningValue - minValue) * (endAngle2 - startAngle2)) /
              (maxValue - minValue)) +
              startAngle2;
    }
    return Container(
      color: widget.backgroundColor,
      child: Center(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: SizedBox(
            width: size,
            height: size,
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(size * 0.075),
                  child: Stack(children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Container(
                        alignment: Alignment.center,
                        width: size,
                        height: size,
                        decoration: BoxDecoration(
                          color: widget.backgroundColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    CustomPaint(
                      size: Size(size, size),
                      painter: ArcPainter(
                          startAngle: 9,
                          sweepAngle: 18,
                          color: widget.warningColor),
                    ),
                    CustomPaint(
                      size: Size(size, size),
                      painter: ArcPainter(
                          startAngle: 9,
                          sweepAngle: warningAngle,
                          color: widget.meterColor),
                    ),
                  ]),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: ClipPath(
                    clipper: TriangleClipper(),
                    child: Container(
                      width: size,
                      height: size * 0.5,
                      color: widget.backgroundColor,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: size * 0.1,
                    height: size * 0.1,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: getKimColor(),
                      boxShadow: [
                        BoxShadow(
                            color: getKimColor(),
                            blurRadius: .1,
                            spreadRadius: 1.0)
                      ],
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Transform.rotate(
                    angle: math.pi / 12 * kimAngle,
                    child: ClipPath(
                      clipper: KimClipper(),
                      child: Container(
                        width: size * 0.9,
                        height: size * 0.9,
                        color: getKimColor(),
                      ),
                    ),
                  ),
                ),

                Container(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Text(
                      //   widget.currentValue.toString(),
                      //   style: widget.displayNumericStyle,
                      // ),
                      Text(
                        widget.displayText,
                        style: widget.displayTextStyle,
                      ),
                    ],
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }

  Color getKimColor() {
    if(widget.currentValue <= widget.warningValue){
      return widget.meterColor;
    }else{
      return widget.warningColor;
    }
  }
}

class ArcPainter extends CustomPainter {
  ArcPainter(
      {this.startAngle = 0, this.sweepAngle = 0, this.color = Colors.white});

  final double startAngle;
  final double sweepAngle;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(size.width * 0.00, size.width * 0.0,
        size.width * 0.95, size.height * 0.95);
    final startAngle = math.pi / 12 * this.startAngle;
    final sweepAngle = math.pi / 12 * this.sweepAngle;
    const useCenter = false;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.1;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width * 0.5, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}

class KimClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width * 0.5, size.width * 0.5);
    path.lineTo(size.width * 0.5 + size.width / 30, size.height * 0.5);
    path.lineTo(size.width * 0.5 + 1, size.height - size.width / 30);
    path.lineTo(size.width * 0.5 - 1, size.height - size.width / 30);
    path.lineTo(size.width * 0.5 - size.width / 30, size.height * 0.5);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(KimClipper oldClipper) => false;
}
