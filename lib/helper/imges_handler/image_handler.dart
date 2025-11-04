import '../../utils/app_const/app_const.dart';

class ImageHandler {
  static String imagesHandle(String? url) {
    if (url == null || url.isEmpty) {
      return AppConstants.resturentImage;
    }

    if (url.startsWith('http')) {
      return url;
    } else {
      return '';
      //  return ApiUrl.imageUrl + url;
    }
  }
}
