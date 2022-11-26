import 'package:bhart_app/networking/api_privider.dart';
import 'package:bhart_app/networking/network_constant.dart';

class HomeRepository {
  ApiProvider apiProvider = new ApiProvider();
  Future<dynamic> gethome() async {
    var res = await apiProvider.getMethod(routeUrl: NetworkConstant.GET_Home);
    return res;
  }
}
