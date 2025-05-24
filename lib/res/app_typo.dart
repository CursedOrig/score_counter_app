part of 'app_res.dart';

class AppTypo {
  AppTypo._();

  static final TextStyle _coreStyle = TextStyle(
      fontFamily: AppFonts.orbitron,
      decoration: TextDecoration.none,
      color: AppColors.textPrimary,
      height: 1.0);

  static final TextStyle headerSpecial = _coreStyle.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 120,
  );

  // Header XL
  static final TextStyle headerXL = _coreStyle.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 36,
  );

  // Header XL32
  static final TextStyle headerXL32 = _coreStyle.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 32,
  );

  // Header L
  static final TextStyle headerL = _coreStyle.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );

  // Header M
  static final TextStyle headerM = _coreStyle.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  // Header S
  static final TextStyle headerS = _coreStyle.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  // Body 1
  static final TextStyle body1 = _coreStyle.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    height: 1.38,
  );

  // Body 2
  static final TextStyle body2 = _coreStyle.copyWith(
    fontWeight: FontWeight.normal,
    fontSize: 16,
    height: 1.38,
  );

  // Body 3
  static final TextStyle body3 = _coreStyle.copyWith(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.normal,
    fontSize: 16,
    height: 1.38,
  );

  // Caption 1
  static final TextStyle caption1 = _coreStyle.copyWith(
    fontWeight: FontWeight.normal,
    fontSize: 14,
    height: 1.38,
  );

  // Caption 2
  static final TextStyle caption2 = _coreStyle.copyWith(
    fontWeight: FontWeight.normal,
    fontSize: 12,
  );
}
