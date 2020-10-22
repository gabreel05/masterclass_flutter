import 'package:mobx/mobx.dart';
part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String picture = 'https://picsum.photos/200/300';

  @observable
  String token = '';

  @action
  void setUser(
    String mName,
    String mEmail,
    String mPicture,
    String mToken,
  ) {
    name = mName;
    email = mEmail;
    picture = mPicture;
    token = mToken;
  }
}
