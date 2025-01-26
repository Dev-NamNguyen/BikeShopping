import 'package:bike_shopping/data/remote/response/api.response.dart';
import 'package:bike_shopping/models/userModel/user.model.dart';
import 'package:bike_shopping/repository/userRepo/user.repo.dart';
import 'package:flutter/material.dart';

class UserVM extends ChangeNotifier {
  final _myRepo = UserRepo();

  ApiResponse<UserModel> userModel = ApiResponse.loading();

  void _setUserMain(ApiResponse<UserModel>? value) {
    userModel = value!;
    notifyListeners();
  }

  Future<void> fetchUserData() async {
    _setUserMain(ApiResponse.loading());

    _myRepo
        .getUserData()
        .then((value) => _setUserMain(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            _setUserMain(ApiResponse.error(error.toString())));
  }
}
