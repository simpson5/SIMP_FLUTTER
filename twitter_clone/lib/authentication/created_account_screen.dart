import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/authentication/customize_your_screen.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';

class CreatedAccountScreen extends StatefulWidget {
  const CreatedAccountScreen({super.key});

  @override
  State<CreatedAccountScreen> createState() => _CreatedAccountScreenState();
}

class _CreatedAccountScreenState extends State<CreatedAccountScreen> {
  // 폼 키 추가
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // 생년월일 컨트롤러 추가
  final TextEditingController _birthdayController = TextEditingController();

  // 상태 변수 추가
  String _name = "";
  String _contactInfo = "";
  bool _isFromCustomize = false; // CustomizeYourScreen에서 돌아왔는지 확인하는 변수

  // 초기 날짜 설정
  DateTime initialDate = DateTime.now();

  // 이메일 검증을 위한 정규식
  final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  // 전화번호 검증을 위한 정규식 (한국 번호 기준)
  final RegExp _phoneRegExp = RegExp(
    r'^010-?([0-9]{4})-?([0-9]{4})$',
  );

  // FocusNode는 포커스 상태를 관리하는 데 사용되는 객체
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _contactFocusNode = FocusNode();
  final FocusNode _birthdayFocusNode = FocusNode();

  // 유효성 검사 상태 추가
  bool _isNameValid = false;
  bool _isContactValid = false;

  @override
  void initState() {
    super.initState();
    // 포커스 리스너 추가
    _birthdayFocusNode.addListener(() {
      if (_birthdayController.value.text.isEmpty) {
        // 생년월일 초기값 설정
        _birthdayController.text = DateTime.now().toString().split(" ").first;
      }
      setState(() {}); // 포커스 상태가 변경될 때마다 화면 갱신
    });
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _contactFocusNode.dispose();
    _birthdayFocusNode.dispose(); // 생년월일 FocusNode 해제
    _birthdayController.dispose(); // 컨트롤러도 해제
    super.dispose();
  }

  // 필드 검증 메소드
  void _onFieldSubmitted(String value) {
    _formKey.currentState?.validate();
  }

  // 이메일 또는 전화번호 유효성 검사 함수
  String? _validateContactInfo(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number or email address cannot be empty";
    }

    // 공백 제거
    value = value.trim();

    // 이메일 형식 검사
    if (value.contains('@')) {
      if (!_emailRegExp.hasMatch(value)) {
        return "Please enter a valid email address";
      }
    }
    // 전화번호 형식 검사
    else {
      // 하이픈 제거 후 검사
      String cleanNumber = value.replaceAll('-', '');
      if (!_phoneRegExp.hasMatch(cleanNumber)) {
        return "Please enter a valid phone number";
      }
    }
    return null;
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  // 이름 유효성 검사 함수
  void _validateName(String value) {
    setState(() {
      _name = value;
      _isNameValid = value.isNotEmpty;
    });
    _formKey.currentState?.validate();
  }

  void _onSubmit() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CustomizeYourScreen(
            previousScreen: widget,
          ),
        ),
      ).then((_) {
        // CustomizeYourScreen에서 돌아왔을 때 상태 업데이트
        setState(() {
          _isFromCustomize = true;
        });
      });
    }
  }

  // 연락처 유효성 검사 함수\
  // 검증과 변화를 하나의 함수로 담고 싶었지만 Stack Overflow 발생...
  // 변화하고 검증을 하자 다시 검증을 하고 검증을 하는 ... 나중에 다시 생각해보자냐
  void _validateContact(String value) {
    setState(() {
      _contactInfo = value;
      if (value.isEmpty) {
        _isContactValid = false;
      } else if (value.contains('@')) {
        _isContactValid = _emailRegExp.hasMatch(value.trim());
      } else {
        String cleanNumber = value.replaceAll('-', '');
        _isContactValid = _phoneRegExp.hasMatch(cleanNumber);
      }
    });
    _formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.size40),
            child: Column(
              children: [
                Gaps.v40,
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: Sizes.size20,
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      FontAwesomeIcons.twitter,
                      color: Color(0xFF4e98e9),
                      size: Sizes.size40,
                    ),
                  ],
                ),
                Gaps.v40,
                Text(
                  "Create your account",
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v20,
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          if (_isNameValid) // 이름이 유효할 때만 체크 표시
                            Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                FontAwesomeIcons.solidCircleCheck,
                                size: Sizes.size32,
                                color: Colors.green,
                              ),
                            ),
                          TextFormField(
                            focusNode: _nameFocusNode,
                            keyboardType: TextInputType.name,
                            autocorrect: false,
                            decoration: InputDecoration(
                              hintText: "Name",
                            ),
                            // 변화를 감지 할때 마다 검증 함수 호출
                            onChanged: _validateName,
                            onFieldSubmitted: _onFieldSubmitted,
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                              _onFieldSubmitted(_name);
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Name cannot be empty";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      Gaps.v20,
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          if (_isContactValid) // 연락처가 유효할 때만 체크 표시
                            Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                FontAwesomeIcons.solidCircleCheck,
                                size: Sizes.size32,
                                color: Colors.green,
                              ),
                            ),
                          TextFormField(
                            focusNode: _contactFocusNode,
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            decoration: InputDecoration(
                              hintText: "Phone number or email address",
                            ),
                            onChanged: _validateContact, // 검증 함수 연결
                            onFieldSubmitted: _onFieldSubmitted,
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                              _onFieldSubmitted(_contactInfo);
                            },
                            validator: _validateContactInfo,
                          ),
                        ],
                      ),
                      Gaps.v20,
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          if (_birthdayController.value.text.isNotEmpty)
                            Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                FontAwesomeIcons.solidCircleCheck,
                                size: Sizes.size32,
                                color: Colors.green,
                              ),
                            ),
                          TextFormField(
                            controller: _birthdayController,
                            focusNode: _birthdayFocusNode,
                            decoration: InputDecoration(
                              hintText: "Date of birth",
                            ),
                            readOnly: true,
                          ),
                        ],
                      ),
                      Gaps.v10,
                      if (_birthdayController.value.text.isNotEmpty)
                        Text(
                          "This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else.",
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        // 생년월일 포커스 상태에 따라 높이 조정
        height: _isFromCustomize
            ? 320
            : _birthdayFocusNode.hasFocus
                ? 320
                : 120,
        child: BottomAppBar(
          color: Colors.white,
          elevation: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.size10),
            child: _isFromCustomize
                ? Expanded(
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: Sizes.size14,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                  text: "By signing up, you agree to the "),
                              TextSpan(
                                text: "Terms of Service",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                              TextSpan(text: " and "),
                              TextSpan(
                                text: "Privacy Policy",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                              TextSpan(text: ", including "),
                              TextSpan(
                                text: "Cookie Use",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                              TextSpan(
                                text:
                                    ". Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy, like keeping your account secure and personalizing our services, including ads. ",
                              ),
                              TextSpan(
                                text: "Learn more",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                              TextSpan(
                                text:
                                    ". Others will be able to find you by email or phone number, when provided, unless you choose otherwise ",
                              ),
                              TextSpan(
                                text: "here",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                              TextSpan(text: "."),
                            ],
                          ),
                        ),
                        Gaps.v20,
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: Sizes.size10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade400,
                            borderRadius: BorderRadius.circular(Sizes.size32),
                          ),
                          child: Center(
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: Sizes.size24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ), // 나중에 새로운 컬럼으로 교체할 빈 공간
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              print(_isNameValid);
                              print(_isContactValid);
                              if (_isNameValid && _isContactValid) {
                                _onSubmit();
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: Sizes.size10,
                                horizontal: Sizes.size32,
                              ),
                              decoration: BoxDecoration(
                                // 이름과 메일이 전부 유효해야 엑티브 상태가 되야 한다.
                                color: _isNameValid && _isContactValid
                                    ? Colors.black
                                    : Colors.grey.shade600,
                                borderRadius:
                                    BorderRadius.circular(Sizes.size32),
                              ),
                              child: Center(
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                    color: _isNameValid && _isContactValid
                                        ? Colors.white
                                        : Colors.grey.shade500,
                                    fontSize: Sizes.size24,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // 생년월일 포커스 상태에 따라 표시
                      if (_birthdayFocusNode.hasFocus) ...[
                        Gaps.v5,
                        Expanded(
                          child: Divider(
                            color: Colors.grey.shade300,
                            thickness: Sizes.size1,
                            endIndent: Sizes.size5,
                          ),
                        ),
                        Gaps.v20,
                        SizedBox(
                          height: 180,
                          child: CupertinoDatePicker(
                            maximumDate: initialDate,
                            initialDateTime: initialDate,
                            mode: CupertinoDatePickerMode.date,
                            onDateTimeChanged: _setTextFieldDate,
                          ),
                        ),
                      ],
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
