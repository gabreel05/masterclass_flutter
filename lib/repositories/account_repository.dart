import 'package:masterclass/models/user.dart';
import 'package:masterclass/view_models/signup_viewmodel.dart';

class AccountRepository {
  Future<User> createAccount(SignupViewModel viewModel) async {
    await Future.delayed(new Duration(milliseconds: 1500));

    return new User(
      id: '1',
      name: 'John',
      email: 'john@example.com',
      picture: 'https://picsum.photos/200/300',
      role: 'student',
      token: '@MasterClass:User',
    );
  }
}
