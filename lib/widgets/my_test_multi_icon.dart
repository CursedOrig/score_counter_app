import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../res/app_res.dart';

enum MyIconState {
  disabled,
  active,
  pressed,
}

class MyIcon extends StatefulWidget {
  const MyIcon({
    super.key,
    required this.iconAsset,
    required this.isBorderEnabled,
    this.onTap,
  });

  final String iconAsset;
  final bool isBorderEnabled;
  final VoidCallback? onTap;

  @override
  State<MyIcon> createState() => _MyIconState();
}

class _MyIconState extends State<MyIcon> {
  MyIconState iconState = MyIconState.active;

  @override
  void initState() {
    super.initState();
    if (widget.onTap == null) {
      iconState = MyIconState.disabled;
    }
  }

  void _handleTapDown(TapDownDetails _) {
    if (widget.onTap != null) {
      setState(() {
        iconState = MyIconState.pressed;
      });
    }
  }

  void _handleTapUp(TapUpDetails _) {
    if (widget.onTap != null) {
      setState(() {
        iconState = MyIconState.active;
      });
    }
  }

  void _handleTapCancel() {
    if (widget.onTap != null) {
      setState(() {
        iconState = MyIconState.active;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Color color;

    switch (iconState) {
      case MyIconState.disabled:
        color = AppColors.gray1;
        break;
      case MyIconState.pressed:
        color = AppColors.primary2;
        break;
      case MyIconState.active:
        color = AppColors.primary1;
        break;
    }

    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: widget.isBorderEnabled ? AppColors.background : null,
          shape: BoxShape.circle,
          border: widget.isBorderEnabled
              ? Border.all(color: color, width: 2)
              : null,
        ),
        child: Center(
          child: SvgPicture.asset(
            widget.iconAsset,
            width: 24,
            height: 24,
            fit: BoxFit.none,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}