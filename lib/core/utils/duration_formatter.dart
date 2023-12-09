class DurationFormatter {
  static String arabic(Duration duration) {
    final days = duration.inDays;
    final months = (days / 30).floor();
    final years = (months / 12).floor();

    if (years > 0) {
      if (years == 1) {
        return 'منذ سنة';
      } else if (years == 2) {
        return "منذ سنتين";
      } else {
        return 'منذ $years سنوات';
      }
    } else if (months > 0) {
      if (months == 1) {
        return 'منذ شهر';
      } else if (months == 2) {
        return "منذ شهرين";
      } else {
        return 'منذ $months أشهر';
      }
    } else if (days > 0) {
      if (days == 1) {
        return 'منذ يوم';
      } else if (days == 2) {
        return 'منذ يومين';
      } else if(days >=11){
        return 'منذ $days يوم';
      }else {
        return 'منذ $days أيام';
      }
    } else {
      return 'اليوم';
    }
  }
}