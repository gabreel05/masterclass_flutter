import 'package:masterclass/models/user.dart';
import 'package:masterclass/repositories/account_repository.dart';
import 'package:masterclass/view_models/signup_viewmodel.dart';

class SignupController {
  AccountRepository accountRepository;

  SignupController() {
    accountRepository = AccountRepository();
  }

  Future<User> create(SignupViewModel viewModel) async {
    viewModel.busy = true;

    var user = accountRepository.createAccount(viewModel);

    viewModel.busy = false;

    return user;
  }
}
