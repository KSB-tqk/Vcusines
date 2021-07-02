import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vcusines/components/constants.dart';
import 'package:vcusines/notifier/authentication.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginDetail extends StatefulWidget {
  const LoginDetail({key}) : super(key: key);

  @override
  _LoginDetailState createState() => _LoginDetailState();
}

class _LoginDetailState extends State<LoginDetail> {
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController resetPasswordMailController;
  final _formKey = GlobalKey<FormState>();
  String _email;
  final auth = FirebaseAuth.instance;
  bool _validate = false;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthenticationService>(context);
    bool checkSnackBarShow = false;
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: size.height * 0.01),
            // Nhập tài khoản email
            TextFormField(
              controller: emailController,
              textInputAction: TextInputAction.next,
              validator: (val) =>
                  val.isNotEmpty ? null : "Email không được để trống!",
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.mail_rounded,
                  color: Colors.black38,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(15),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(15),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38),
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: EdgeInsets.all(10),
                hintText: "Email",
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.black26,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            // Nhập mật khẩu
            TextField(
              controller: passwordController,
              obscureText: true,
              inputFormatters: [
                FilteringTextInputFormatter.deny(new RegExp('[\\.|\\,| -]'))
              ],
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock_rounded,
                  color: Colors.black38,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(15),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(15),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38),
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: EdgeInsets.all(10),
                hintText: "Mật khẩu",
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.black26,
                ),
              ),
            ),

            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              "Đăng nhập ngay!",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              "Cùng trải nghiệm ẩm thực Việt!",
              style: TextStyle(
                fontSize: 14,
                color: kPrimaryColor,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              width: size.width * 0.5,
              height: size.height * 0.065,
              child: OutlinedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {}
                  final String messege = await loginProvider.signIn(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                  if (!checkSnackBarShow) {
                    checkSnackBarShow = true;
                    await ScaffoldMessenger.of(context)
                        .showSnackBar(
                          SnackBar(
                            content: Text(
                              '$messege',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            backgroundColor: kPrimaryColor,
                            duration: const Duration(milliseconds: 2000),
                          ),
                        )
                        .closed;
                    checkSnackBarShow = false;
                  }
                },
                child: Text(
                  "Đăng nhập",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: kPrimaryColor),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
                onPressed: () {
                  Alert(
                      context: context,
                      title: "Quên Mật Khẩu",
                      content: Column(
                        children: <Widget>[
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              icon: Icon(Icons.mail, color: kPrimaryColor),
                              labelText: 'Email',
                              hintText: 'Nhập email bạn đã đăng ký',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black38),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black38),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusColor: kPrimaryColor,
                              fillColor: kPrimaryColor,
                              hoverColor: kPrimaryColor,
                            ),
                            controller: resetPasswordMailController,
                            onChanged: (value) {
                              setState(() {
                                _email = value;
                              });
                            },
                          ),
                        ],
                      ),
                      buttons: [
                        DialogButton(
                          onPressed: () {
                            loginProvider.sendResetPassWord(_email);
                            showAlertDialog(context);
                          },
                          child: Text(
                            "Gửi Email Reset Mật Khẩu",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          color: kPrimaryColor,
                        )
                      ]).show();
                },
                child: Text("Quên Mật Khẩu?"),
                style: TextButton.styleFrom(primary: Colors.black54))
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Email không hợp lệ"),
    content: Text("Email không được để trống!"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
