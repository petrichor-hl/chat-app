import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _isLogin = true;
  String _enteredEmail = '';
  String _enteredPassword = '';

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.jpeg',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Center(
              heightFactor: 1.45,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Image.asset(
                        'assets/images/chat_logo.png',
                        width: 170,
                        height: 170,
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(0, 255, 255, 255),
                              Color.fromARGB(200, 180, 223, 212),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Email address',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  autocorrect: false,
                                  textCapitalization: TextCapitalization.none,
                                  validator: (value) {
                                    if (value == null ||
                                        value.trim().isEmpty ||
                                        !value.contains('@')) {
                                      return 'Please enter a valid email address.';
                                    }
                                    return null;
                                  },
                                  onSaved: (newValue) {
                                    _enteredEmail = newValue!;
                                  },
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  autocorrect: false,
                                  textCapitalization: TextCapitalization.none,
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null ||
                                        value.trim().length < 6) {
                                      return 'Please must be at least 6 characters long.';
                                    }
                                    return null;
                                  },
                                  onSaved: (newValue) {
                                    _enteredPassword = newValue!;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: FilledButton(
                                    onPressed: _submit,
                                    child: Text(
                                      _isLogin ? 'Login' : 'Sign up',
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _isLogin = !_isLogin;
                                    });
                                  },
                                  child: Text(_isLogin
                                      ? 'Create new account'
                                      : 'I already have an account'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
