import 'package:flutter/material.dart';

class GradientSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Gradient activeThumbGradient;
  final Gradient inactiveThumbGradient;
  final Color activeTrackColor;
  final Color inactiveTrackColor;

  const GradientSwitch({super.key,
    required this.value,
    required this.onChanged,
    required this.activeThumbGradient,
    required this.inactiveThumbGradient,
    required this.activeTrackColor,
    required this.inactiveTrackColor,
  });

  @override
  _GradientSwitchState createState() => _GradientSwitchState();
}

class _GradientSwitchState extends State<GradientSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 50),
    );
    if (widget.value) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(covariant GradientSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            width: 54,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.lerp(
                widget.inactiveTrackColor,
                widget.activeTrackColor,
                _controller.value,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: _controller.value * 22,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: _controller.value == 1.0
                          ? widget.activeThumbGradient
                          : widget.inactiveThumbGradient,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
