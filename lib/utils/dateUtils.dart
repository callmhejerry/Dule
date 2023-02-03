extension ToDays on DateTime {
  String toDays() {
    String day;
    switch (month) {
      case 1:
        day = "Jan";
        break;
      case 2:
        day = "Feb";
        break;
      case 3:
        day = "Mar";
        break;
      case 4:
        day = "Apr";
        break;
      case 5:
        day = "May";
        break;
      case 6:
        day = "Jun";
        break;
      case 7:
        day = "Jul";
        break;
      case 8:
        day = "Aug";
        break;
      case 9:
        day = "Sep";
        break;
      case 10:
        day = "Oct";
        break;
      case 11:
        day = "Nov";
        break;
      case 12:
        day = "Dec";
        break;
      default:
        day = "";
    }
    return day;
  }
}
