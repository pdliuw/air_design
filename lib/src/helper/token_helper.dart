import 'package:air_design/src/http/HttpManager.dart';

///
/// TokenHelper
class TokenHelper {
  static String fullToken(ResponseModel model) {
    String accessToken = model.data['result']['access_token'];
//    String tokenType = model.data['result']['token_type'];
    String tokenType = "Bearer";

    String fullToken = "$tokenType $accessToken";
    return fullToken;
  }
}
