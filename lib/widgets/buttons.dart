import 'package:flutter/material.dart';
import 'package:irrish_driving/widgets/colors.dart';

class AuthButton extends StatelessWidget {
  final Function()? onPressed;
  final String? title;
  final String? image;
  const AuthButton({Key? key, this.onPressed, this.title, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed ?? () {},
      child: Center(
        child: Container(
          height: 53,
          width: 343,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 30, color: Color(0xff8377C6).withOpacity(.11))
            ],
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              colors: [Colors.white, Colors.white],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "$image",
                  height: 23,
                  width: 23,
                ),
              ),
              Text(
                "$title",
                style: const TextStyle(
                    color: Color(0xff160F29),
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    fontFamily: "ProximaNova"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//Join Button Class
class JoinButton extends StatelessWidget {
  final Function()? onPressed;
  final String? title;
  final Widget? circular;
  const JoinButton({Key? key, this.onPressed, this.title, this.circular})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(343, 48),
          backgroundColor: mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        onPressed: onPressed ?? () {},
        child: Text(
          "$title",
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
              fontFamily: "ProximaNova"),
        ),
      ),
    );
  }
}

//Contianer Button
class CtButton extends StatelessWidget {
  final Function()? onPressed;
  final String? title;
  final Widget? circular;
  const CtButton({Key? key, this.onPressed, this.title, this.circular})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(300, 60),
          backgroundColor: ctcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1.0),
          ),
        ),
        onPressed: onPressed ?? () {},
        child: Text(
          "$title",
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
              fontFamily: "ProximaNova"),
        ),
      ),
    );
  }
}

//Round Button
class RoundButton extends StatelessWidget {
  final Function()? onPressed;
  final String? title;
  final Widget? circular;
  const RoundButton({Key? key, this.onPressed, this.title, this.circular})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(300, 60),
          backgroundColor: ctcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
        ),
        onPressed: onPressed ?? () {},
        child: Text(
          "$title",
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
              fontFamily: "ProximaNova"),
        ),
      ),
    );
  }
}
