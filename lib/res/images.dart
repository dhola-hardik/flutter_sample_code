Images images = Images();

class Images {
  static final Images _images = Images._i();

  factory Images() {
    return _images;
  }

  Images._i();

  ///
  static const String iconDir = "assets/icons";
  static const String imageDir = "assets/images";

  final String app_icon = "$iconDir/app_icon.jpeg";
  final String ic_email = "$iconDir/ic_email.png";
  final String ic_logout = "$iconDir/ic_logout.png";
  final String ic_new = "$iconDir/ic_new.png";
  final String ic_password = "$iconDir/ic_password.png";
  final String ic_reports = "$iconDir/ic_reports.png";
  final String ic_user = "$iconDir/ic_user.png";
  final String ic_checked = "$iconDir/ic_checked.png";
  final String ic_uncheck = "$iconDir/ic_uncheck.png";
  final String ic_ = "$iconDir/";

  final String ic_i = "$imageDir/";
  // final String ic_ = "$imageDir/";

  final String url_1 = "https://images.pexels.com/photos/6432123/pexels-photo-6432123.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  final String url_2 = "https://images.pexels.com/photos/7063757/pexels-photo-7063757.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  final String url_3 = "https://images.pexels.com/photos/6437462/pexels-photo-6437462.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  final String url_4 = "https://images.pexels.com/photos/6432125/pexels-photo-6432125.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  final String url_5 = "https://images.pexels.com/photos/3184360/pexels-photo-3184360.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  final String url_6 = "https://images.pexels.com/photos/6353765/pexels-photo-6353765.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  final String url_7 = "https://images.pexels.com/photos/1367269/pexels-photo-1367269.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
}
