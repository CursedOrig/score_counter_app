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

  static BoxDecoration historyOuterItemDeco = BoxDecoration(
    color: AppColors.layer1,
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    border: Border.all(width: 2, color: AppColors.layer2),
  );

  static BoxDecoration historyInnerItemDeco = const BoxDecoration(
    color: AppColors.layer2,
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(10),
      bottomLeft: Radius.circular(10),
    ),
  );

  static BoxDecoration historyDeletingItemDeco = const BoxDecoration(
    color: AppColors.redSystem,
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  );
}
