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

  static BoxDecoration dialogDeco = BoxDecoration(
    borderRadius: BorderRadius.circular(28),
    color: AppColors.background,
    border: Border.all(
      width: 2,
      color: AppColors.layer2,
    ),

  );
}
