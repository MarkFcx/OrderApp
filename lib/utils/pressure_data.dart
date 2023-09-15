import 'dart:math';

// 压力数据处理，传入8个位置点的压力数据，得到内外侧压力，内外侧中心点坐标，cp角，内外侧压力差
class PressureData {
  final double point1; // 8个位置点数据
  final double point2;
  final double point3;
  final double point4;
  final double point5;
  final double point6;
  final double point7;
  final double point8;
  final bool isMini; // false正常显示传感器数据，true显示轨迹或截图记录
  // 通过处理得到以下数据
  late double _insidePressure; // 内侧压力
  late double _outsidePressure; // 外侧压力
  late double _pressureDifference; // 内外侧压力差
  late double _insideCenterX; // 内侧重心点x坐标
  late double _insideCenterY; // 内侧重心点y坐标
  late double _outsideCenterX; // 内侧重心点x坐标
  late double _outsideCenterY; // 内侧重心点y坐标
  late double _cpAngle; // CP角
  PressureData(
      {required this.isMini,
      required this.point1,
      required this.point2,
      required this.point3,
      required this.point4,
      required this.point5,
      required this.point6,
      required this.point7,
      required this.point8}) {
    process();
  }

  PressureData.init()
      : isMini = false,
        point1 = 0,
        point2 = 0,
        point3 = 0,
        point4 = 0,
        point5 = 0,
        point6 = 0,
        point7 = 0,
        point8 = 0,
        _insidePressure = 0,
        _insideCenterX = 0,
        _insideCenterY = 0,
        _outsidePressure = 0,
        _outsideCenterX = 0,
        _outsideCenterY = 0,
        _cpAngle = 0;

  void process() {
    // 数据处理算法描述如下：
    // 1. 受力点/重心点的位置的计算
    //    8个压力点分内外各4个，每个点在底图上有一个坐标，以底图左上角为原点
    //    内外侧4个位置点的压力值和坐标，做加权平均，得出内外侧的重心点坐标
    // 2. 内外侧压力值计算
    //    压力值为4个压力点压力值之和
    // 3. CP角计算
    //    CP角为内外侧重心点之间连线与水平位置的夹角
    if (isMini) {
      // 查看轨迹记录时，使用小底图
      _insideCenterX = (255 * 0.458 * point1 +
              77 * 0.458 * point2 +
              100 * 0.458 * point3 +
              255 * 0.458 * point4) /
          (point1 + point2 + point3 + point4);
      _insideCenterY = (100 * 0.458 * point1 +
              162 * 0.458 * point2 +
              375 * 0.458 * point3 +
              465 * 0.458 * point4) /
          (point1 + point2 + point3 + point4);

      _outsideCenterX = (630 * 0.458 * point5 +
              808 * 0.458 * point6 +
              786 * 0.458 * point7 +
              630 * 0.458 * point8) /
          (point8 + point7 + point6 + point5);
      _outsideCenterY = (100 * 0.458 * point5 +
              162 * 0.458 * point6 +
              375 * 0.458 * point7 +
              465 * 0.458 * point8) /
          (point8 + point7 + point6 + point5);
    } else {
      // 测量页正常显示时，使用大底图
      _insideCenterX =
          (255 * point1 + 77 * point2 + 100 * point3 + 255 * point4) /
              (point1 + point2 + point3 + point4);
      _insideCenterY =
          (100 * point1 + 162 * point2 + 375 * point3 + 465 * point4) /
              (point1 + point2 + point3 + point4);

      _outsideCenterX =
          (630 * point5 + 808 * point6 + 786 * point7 + 630 * point8) /
              (point8 + point7 + point6 + point5);
      _outsideCenterY =
          (100 * point5 + 162 * point6 + 375 * point7 + 465 * point8) /
              (point8 + point7 + point6 + point5);
    }
    _insidePressure = point1 + point2 + point3 + point4;
    _insidePressure = _insidePressure / 10;
    _outsidePressure = point8 + point7 + point6 + point5;
    _outsidePressure = _outsidePressure / 10;
    _pressureDifference = _insidePressure - _outsidePressure;
    // 利用反三角函数计算CP角度,所谓CP角即内外侧重心点连线与水平线所成的角度
    _cpAngle = atan((_outsideCenterY - _insideCenterY) /
            (_outsideCenterX - _insideCenterX)) *
        180;
  }

  double get insidePressure {
    return _insidePressure;
  }

  double get outsidePressure {
    return _outsidePressure;
  }

  double get pressureDifference {
    return _pressureDifference;
  }

  double get insideCenterX {
    return _insideCenterX;
  }

  double get outsideCenterX {
    return _outsideCenterX;
  }

  double get insideCenterY {
    return _insideCenterY;
  }

  double get outsideCenterY {
    return _outsideCenterY;
  }

  double get cpAngle {
    return _cpAngle;
  }
}
