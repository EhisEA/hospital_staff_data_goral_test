import '../models/week_data.dart';

class Utils {

  
  String printDuration(Shift shiftDuration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String startTwoDigitMinutes =
        twoDigits(shiftDuration.start.inMinutes.remainder(60));
    String stopTwoDigitMinutes =
        twoDigits(shiftDuration.stop.inMinutes.remainder(60));
    return "${twoDigits(shiftDuration.start.inHours)}:$startTwoDigitMinutes - ${twoDigits(shiftDuration.stop.inHours)}:$stopTwoDigitMinutes";
  }
}
