part of 'app_res.dart';

class AppDeco {
  AppDeco._();

  static BoxDecoration timerDeco = BoxDecoration(
    boxShadow: Shadows.mainShadow,
    color: AppColors.background,
    borderRadius: BorderRadius.circular(28),
    border: Border.all(
      color: AppColors.primary1,
      width: 2.0,
    ),
  );
}
