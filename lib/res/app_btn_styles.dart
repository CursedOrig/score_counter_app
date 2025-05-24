part of 'app_res.dart';

class AppBtnStyles {
  AppBtnStyles._();

  static final primaryBtnStyle = ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith<Color>(
      (states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.greenTertiary;
        }
        if (states.contains(WidgetState.pressed)) return AppColors.primary2;
        return AppColors.primary1;
      },
    ),
    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    )),
    minimumSize: const WidgetStatePropertyAll(Size(double.infinity, 54)),
    textStyle: WidgetStatePropertyAll(AppTypo.headerS),
    foregroundColor: WidgetStateProperty.resolveWith<Color>(
      (states) {
        if (states.contains(WidgetState.disabled)) return AppColors.gray1;
        return AppColors.background;
      },
    ),
  );

  static final secondaryBtnStyle = ButtonStyle(
    backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
    shape: WidgetStateProperty.resolveWith(
      (states) => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
            color: states.contains(WidgetState.disabled)
                ? AppColors.greenTertiary
                : AppColors.primary1,
            width: 2),
      ),
    ),
    minimumSize: const WidgetStatePropertyAll(Size(double.infinity, 54)),
    textStyle: WidgetStatePropertyAll(AppTypo.headerS),
    foregroundColor: WidgetStateProperty.resolveWith<Color>(
      (states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.greenTertiary;
        }
        if (states.contains(WidgetState.pressed)) return AppColors.primary2;
        return AppColors.primary1;
      },
    ),
  );
}
