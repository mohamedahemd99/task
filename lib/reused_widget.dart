import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  @required Function function,
  @required String text,
  double radius = 15.0,
  String image,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: background),
      child: MaterialButton(
        onPressed: function,
        child: image != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      image: AssetImage(
                    image,
                  ),height: 35,fit: BoxFit.cover,),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    isUpperCase ? text.toUpperCase() : text,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )
            : Text(
                isUpperCase ? text.toUpperCase() : text,
                style: TextStyle(color: Colors.white),
              ),
      ),
    );

Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmit,
  Function suffixPressed,
  @required Function validate,
  @required String label,
  IconData suffix,
  bool isPassword = false,
}) =>
    TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      validator: validate,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFfdecea),
        labelText: label,
        suffixIcon: suffix != null
            ? InkWell(onTap: suffixPressed, child: Icon(suffix))
            : null,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),

        ),

      ),
    );
void navigateAndFinish(context,widget)=> Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder:(context) => widget,
    ),
        (route){
      return false;
    }
);

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));
