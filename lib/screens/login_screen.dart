import 'package:flutter/material.dart';
import 'package:movie_app/screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Login Title
                  _loginTitle(context),

                  //Login SubTitle
                  _loginSubtitle(),

                  //Phone Number
                  _phoneNumber(),

                  //Password
                  _passWord(),

                  //Forgot password
                  _forgotPassword()
                ],
              ),
            ),

            //Sign up and Login button
            _signUpAndLogin()
          ],
        ),
      ),
    );
  }

  //Login Title
  Widget _loginTitle(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 40),
      child: const Text(
        'Đăng nhập',
        style: TextStyle(
          color: Color(0xff004343),
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  //Login Subtitle
  Widget _loginSubtitle() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: const Text(
        'Đăng nhập bằng tài khoản của bạn để tiếp tục',
        style: TextStyle(
          color: Color(0xffADADAD),
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  //Phone Number
  Widget _phoneNumber() {
    return Container(
      padding: const EdgeInsets.fromLTRB(40, 60, 40, 0),
      child: const TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          hintText: "Số điện thoại",
        ),
      ),
    );
  }

  //Password
  Widget _passWord() {
    return Container(
      padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
      child: TextField(
        obscureText: _obscureText,
        decoration: InputDecoration(
            hintText: "Mật khẩu",
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            suffixIcon: IconButton(
                onPressed: () {
                  _toggle();
                },
                icon: _obscureText
                    ? Image.asset('assets/images/password_visible.png')
                    : Image.asset('assets/images/password_invisible.png'))),
        keyboardType: TextInputType.visiblePassword,
      ),
    );
  }

  //Forgot password
  Widget _forgotPassword(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8, right: 40),
          child: const Text(
            'Quên mật khẩu',
            style: TextStyle(
              color: Color(0xffADADAD),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }

  //Sign up and Login button
  Widget _signUpAndLogin() {
    return Container(
      height: 140,
      margin: const EdgeInsets.only(top: 170),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {},
            child: GestureDetector(
              onTap: () {},
              child: const Text(
                'Chưa có tài khoản. Đăng ký ngay!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: ElevatedButton(
                onPressed: () {

                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xffF8F9D3)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                child: const Text(
                  'Đăng nhập',
                  style: TextStyle(
                    color: Color(0xff004343),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
