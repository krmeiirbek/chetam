import '../entities/contact.dart';
import '../utils/http.dart';

class ContactAPI {
  static Future<ContactResponseEntity> postContact() async {
    var response = await HttpUtil().post(
      'api/contact',
    );
    return ContactResponseEntity.fromJson(response);
  }
}
