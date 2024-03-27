import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/auth_repository.dart';
import '../../models/user.dart';

class LoginViewController extends StateNotifier<AsyncData<void>>{
  final AuthRepository authRepository;

  LoginViewController({required this.authRepository}): super(const AsyncData(null));

  Future<bool> login(User user) async{
    return await authRepository.login(user);
  }
}

final loginViewControllerProvider = StateNotifierProvider<LoginViewController, AsyncValue<void>>((ref) => LoginViewController(authRepository: ref.watch(authRepositoryProvider)));