import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/authentication/customize_experience_screen.dart';
import 'package:twitter_clone/constants/gaps.dart';
import 'package:twitter_clone/constants/sizes.dart';
import 'package:twitter_clone/widgets/app_bar.dart';
import 'package:twitter_clone/widgets/next_button.dart';
import 'package:twitter_clone/widgets/sign_up_button.dart';

class CreatedAccountScreen extends StatefulWidget {
  const CreatedAccountScreen({super.key});

  @override
  State<CreatedAccountScreen> createState() => _CreatedAccountScreenState();
}

class _CreatedAccountScreenState extends State<CreatedAccountScreen> {
  // 이메일 검증을 위한 정규식
  final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  // 전화번호 검증을 위한 정규식 (한국 번호 기준)
  final RegExp _phoneRegExp = RegExp(
    r'^010-?([0-9]{4})-?([0-9]{4})$',
  );

  // 폼 키 추가
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // 생년월일 컨트롤러 추가
  final TextEditingController _birthdayController = TextEditingController();

  // 상태 변수 추가
  String _name = "";
  String _contactInfo = "";
  bool _isFromCustomize = false; // CustomizeYourScreen에서 돌아왔는지 확인하는 변수
  bool _isBirthdayFocus = false;

  // FocusNode는 포커스 상태를 관리하는 데 사용되는 객체
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _contactFocusNode = FocusNode();
  final FocusNode _birthdayFocusNode = FocusNode();

  // 유효성 검사 상태 추가
  bool _isNameValid = false;
  bool _isContactValid = false;
  bool _isBirthdayValid = false;

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

  // 이름 유효성 검사 함수
  void _validateName(String value) {
    setState(() {
      _name = value;
      _isNameValid = value.isNotEmpty;
    });
    _formKey.currentState?.validate();
  }

  // 제출 버튼 클릭 시 호출되는 함수 : customize_experience 화면으로 이동
  Future<void> _onSubmit() async {
    // 폼 검증
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      // 폼 저장
      _formKey.currentState!.save();
      //
      final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CustomizeExperienceScreen(
            previousScreen: widget,
          ),
        ),
      );
      // 기존 코드 : 화면으로 이동시 동의 여부 상관없이 _isFromCustomize 변경
      // .then((_) {
      //   // CustomizeYourScreen에서 돌아왔을 때 상태 업데이트
      //   setState(() {
      //     // _isFromCustomize = true;
      //   });
      // });

      // When a BuildContext is used from a StatefulWidget, the mounted property
      // must be checked after an asynchronous gap.
      if (!context.mounted) return;

      // 화면 이동 후 상태 값을 전달 받아 업데이트
      setState(() {
        _isFromCustomize = result ?? false;
      });
    }
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  // showCupertinoModalPopup
  // iOS 스타일의 모달 팝업을 표시하는 Flutter의 내장 함수
  // https://api.flutter.dev/flutter/cupertino/showCupertinoModalPopup.html
  void _showDatePicker(BuildContext context) {
    if (_isFromCustomize) {
      return;
    }

    if (_birthdayController.text.isEmpty) {
      _birthdayController.text = DateTime.now().toString().split(" ").first;
    }

    _isBirthdayFocus = true;
    _isBirthdayValid = true;
    setState(() {});

    showCupertinoModalPopup(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) => SizedBox(
        height: 180,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Gaps.v5,
            Divider(
              color: Colors.grey.shade300,
              thickness: Sizes.size1,
              endIndent: Sizes.size5,
            ),
            Expanded(
              child: CupertinoDatePicker(
                maximumDate: DateTime.now(),
                initialDateTime: _birthdayController.text.isEmpty
                    ? DateTime.now()
                    : DateTime.parse(_birthdayController.text),
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: _setTextFieldDate,
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ).then((_) {
      // 모달 팝업이 닫힐 때 포커스 상태 업데이트
      _birthdayFocusNode.unfocus();
      setState(() {
        _isBirthdayFocus = false;
      });
    });
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
      appBar: const AppBarWidget(
        leadingType: LeadingType.cancel,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizes.size40),
        child: Column(
          children: [
            Gaps.v20,
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
                        onTap: () {
                          _showDatePicker(context);
                        },
                        decoration: InputDecoration(
                          hintText: "Date of birth",
                        ),
                        readOnly: true,
                      ),
                    ],
                  ),
                  Gaps.v10,
                  if (_isBirthdayFocus)
                    Text(
                      "This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else.",
                    ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        height: _isFromCustomize
            ? 320
            : _isBirthdayFocus
                ? 250
                : 120,
        child: BottomAppBar(
          color: Colors.white,
          elevation: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.size10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _isFromCustomize
                      ? SignUpButton(
                          name: _name,
                          contactInfo: _contactInfo,
                          birthday: _birthdayController.text,
                        )
                      : NextButton(
                          isNameValid: _isNameValid,
                          isContactValid: _isContactValid,
                          isBirthdayValid: _isBirthdayValid,
                          onNext: _onSubmit,
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// TODO : Form 위젯 분리하기...
class _CreateAccountForm extends StatefulWidget {
  @override
  State<_CreateAccountForm> createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<_CreateAccountForm> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
