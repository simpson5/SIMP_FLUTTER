import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/authentication/password_screen.dart';
import 'package:twitter_clone/constants/button_form.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/authentication/widgets/app_bar.dart';

class ConfirmCodeScreen extends StatefulWidget {
  final String name;
  final String contactInfo;
  final String birthday;

  const ConfirmCodeScreen({
    super.key,
    required this.name,
    required this.contactInfo,
    required this.birthday,
  });

  @override
  State<ConfirmCodeScreen> createState() => _ConfirmCodeScreenState();
}

class _ConfirmCodeScreenState extends State<ConfirmCodeScreen> {
  String _name = "";
  String _contactInfo = "";
  String _birthday = "";

  String _code = "";

  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  final List<FocusNode> _focusNodes = List.generate(
    6,
    (index) => FocusNode(),
  );

  @override
  void initState() {
    super.initState();
    _name = widget.name;
    _contactInfo = widget.contactInfo;
    _birthday = widget.birthday;
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onCodeChanged(String value, int index) {
    if (value.length == 1 && index < 5) {
      _focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    _code = "";

    for (var controller in _controllers) {
      _code += controller.text;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        leadingType: LeadingType.back,
      ),
      body: GestureDetector(
        onTap: () {
          for (var node in _focusNodes) {
            node.unfocus();
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              Text(
                "We sent you a code",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v20,
              Text(
                "Enter it below to verify",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              Gaps.v5,
              Text(
                _contactInfo,
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              Gaps.v40,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  6,
                  (index) => SizedBox(
                    width: Sizes.size44,
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      decoration: InputDecoration(
                        counterText: "",
                        // 일반 상태 보더
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: Sizes.size3,
                          ),
                        ),
                        // 포커스 상태 보더
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: Sizes.size3,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: Sizes.size16,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: Sizes.size28,
                        fontWeight: FontWeight.w900,
                      ),
                      keyboardType: TextInputType.numberWithOptions(
                        signed: false,
                        decimal: false,
                      ),
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      onChanged: (value) => _onCodeChanged(value, index),
                    ),
                  ),
                ),
              ),
              Gaps.v20,
              if (_code.length == 6)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.solidCircleCheck,
                      size: Sizes.size40,
                      color: Colors.green,
                    ),
                  ],
                ),
              // 기존 spacer 사용 했느나 이벤트가 적용되지 않아
              // Expanded 로 변경
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    for (var node in _focusNodes) {
                      node.unfocus();
                    }
                  },
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Didn't receive the code?"),
                  BottomAppBar(
                    padding: EdgeInsets.symmetric(
                      vertical: Sizes.size10,
                    ),
                    color: Colors.white,
                    elevation: 0,
                    child: ButtonForm(
                      text: "Next",
                      buttonColor:
                          _code.length == 6 ? Colors.black : Colors.grey,
                      textColor: _code.length == 6
                          ? Colors.white
                          : Colors.grey.shade300,
                      onTap: () {
                        if (_code.length < 6) return;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PasswordScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
