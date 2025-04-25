class Insets {
  static const double maxWidth = 1100;
  static double get med => 12;
  static double get xs => 4;
}

abstract class AppInsets {
  double get Padding;
  double get appBarH;
}

class LargeInsets extends AppInsets {
  @override
  // TODO: implement Padding
  double get Padding => 80;

  @override
  // TODO: implement appBarH
  double get appBarH => 64;
}

class SmallInsets extends AppInsets {
  @override
  // TODO: implement Padding
  double get Padding => 16;

  @override
  // TODO: implement appBarH
  double get appBarH => 50;
}
