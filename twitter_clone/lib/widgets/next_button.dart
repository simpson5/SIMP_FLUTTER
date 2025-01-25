import 'package:flutter/material.dart';
import 'package:twitter_clone/constants/sizes.dart';

class NextButton extends StatelessWidget {
  final bool isNameValid;
  final bool isContactValid;
  final bool isBirthdayValid;
  final Function() onNext;
  const NextButton({
    super.key,
    required this.isNameValid,
    required this.isContactValid,
    required this.isBirthdayValid,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                if (isNameValid && isContactValid && isBirthdayValid) {
                  onNext();
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: Sizes.size10,
                  horizontal: Sizes.size32,
                ),
                decoration: BoxDecoration(
                  // 이름과 메일이 전부 유효해야 엑티브 상태가 되야 한다.
                  color: isNameValid && isContactValid && isBirthdayValid
                      ? Colors.black
                      : Colors.grey.shade600,
                  borderRadius: BorderRadius.circular(Sizes.size32),
                ),
                child: Center(
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: isNameValid && isContactValid && isBirthdayValid
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
      ],
    );
  }
}
