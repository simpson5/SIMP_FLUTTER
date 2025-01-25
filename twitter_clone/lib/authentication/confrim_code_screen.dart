import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/button_form.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/widgets/app_bar.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        leadingType: LeadingType.back,
      ),
      body: Padding(
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
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: Sizes.size20,
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.w600,
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    onChanged: (value) => _onCodeChanged(value, index),
                  ),
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Column(
              children: [
                Text("Didn't receive the code?"),
                BottomAppBar(
                  color: Colors.white,
                  elevation: 0,
                  child: ButtonForm(
                    text: "Next",
                    buttonColor: Colors.black,
                    textColor: Colors.white,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
