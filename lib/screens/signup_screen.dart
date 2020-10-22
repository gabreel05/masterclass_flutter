import 'package:flutter/material.dart';
import 'package:masterclass/controllers/signup_controller.dart';
import 'package:masterclass/screens/home_screen.dart';
import 'package:masterclass/stores/app_store.dart';
import 'package:masterclass/view_models/signup_viewmodel.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formkey = GlobalKey<FormState>();

  final _controller = SignupController();

  var viewModel = SignupViewModel();

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppStore>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                Text('Cadastre-se'),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Nome inválido';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    viewModel.name = value;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'E-mail inválido';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    viewModel.email = value;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Senha inválida';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    viewModel.password = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                viewModel.busy
                    ? Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.black,
                        ),
                      )
                    : FlatButton(
                        color: Theme.of(context).primaryColor,
                        child: Text('Cadastrar'),
                        onPressed: () {
                          if (_formkey.currentState.validate()) {
                            _formkey.currentState.save();
                          }

                          setState(() {});
                          _controller.create(viewModel).then((value) {
                            store.setUser(
                              value.name,
                              value.email,
                              value.picture,
                              value.token,
                            );

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          });
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
