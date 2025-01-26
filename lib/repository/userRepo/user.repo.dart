import 'package:bike_shopping/data/remote/network/api.end.points.dart';
import 'package:bike_shopping/data/remote/network/base.api.service.dart';
import 'package:bike_shopping/data/remote/network/network.api.service.dart';
import 'package:bike_shopping/models/userModel/user.model.dart';

class UserRepo {
  final BaseApiService _apiService = NetworkApiService();

  Future<UserModel?> getUserData() async {
    try {
      dynamic response = await _apiService.getResponse(ApiEndPoints().signIn);
      return UserModel.fromJson(response);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
