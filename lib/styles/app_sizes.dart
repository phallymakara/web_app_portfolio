class Insets {
  static const double maxWidth = 1100;
  static double get med => 12;
  static double get xxxl => 80;
  static double get xs => 4;
  static double get lg => 24;
}

abstract class AppInsets {
  double get Padding;
  double get appBarH;
  double get cardpadding;
  double get gap;
}

class LargeInsets extends AppInsets {
  @override
  // TODO: implement Padding
  double get Padding => 80;

  @override
  // TODO: implement appBarH
  double get appBarH => 64;

  @override
  // TODO: implement cardpadding
  double get cardpadding => Insets.xs;

  @override
  // TODO: implement gap
  double get gap => 120;
}

class SmallInsets extends AppInsets {
  @override
  // TODO: implement Padding
  double get Padding => 16;

  @override
  // TODO: implement appBarH
  double get appBarH => 50;

  @override
  // TODO: implement cardpadding
  double get cardpadding => Insets.lg;

  @override
  // TODO: implement gap
  double get gap => 72;
}
