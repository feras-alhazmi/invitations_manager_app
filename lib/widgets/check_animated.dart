import 'package:dash_invitation_app/exports.dart';

class AnimatedCheck extends StatefulWidget {
  @override
  _AnimatedCheckState createState() => _AnimatedCheckState();
}

class _AnimatedCheckState extends State<AnimatedCheck>
    with TickerProviderStateMixin {
  late AnimationController scaleController = AnimationController(
      duration: const Duration(milliseconds: 500), vsync: this);
  late Animation<double> scaleAnimation =
      CurvedAnimation(parent: scaleController, curve: Curves.elasticOut);
  late AnimationController checkController = AnimationController(
      duration: const Duration(milliseconds: 200), vsync: this);
  late Animation<double> checkAnimation =
      CurvedAnimation(parent: checkController, curve: Curves.linear);

  @override
  void initState() {
    super.initState();
    scaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkController.forward();
      }
    });
    scaleController.forward();
  }

  @override
  void dispose() {
    scaleController.dispose();
    checkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double circleSize = 70;
    double iconSize = 54;

    return SizedBox(
      width: 140,
      height: 100,
      child: Stack(
        children: [
          Center(
            child: ScaleTransition(
              scale: scaleAnimation,
              child: Container(
                height: circleSize,
                width: circleSize,
                decoration: BoxDecoration(
                  color: Colors.green.shade900,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          SizeTransition(
            sizeFactor: checkAnimation,
            axis: Axis.horizontal,
            axisAlignment: -1,
            child: Center(
              child: Icon(Icons.check, color: Colors.white, size: iconSize),
            ),
          ),
        ],
      ),
    );
  }
}
