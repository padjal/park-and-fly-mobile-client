import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/auth_repository.dart';
import '../../models/user.dart';

class RegistrationViewController extends StateNotifier<AsyncData<void>>{
  final AuthRepository authRepository;

  RegistrationViewController({required this.authRepository}): super(const AsyncData(null));

  Future<bool> register(User user) async{
    return await authRepository.register(user);
  }
}

final registrationViewControllerProvider = StateNotifierProvider<RegistrationViewController, AsyncValue<void>>((ref) => RegistrationViewController(authRepository: ref.watch(authRepositoryProvider)));