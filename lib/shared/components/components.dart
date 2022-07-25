import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultButton({
  required Function() onPressed,
  required String text,
  double height = 60.0,
  double radius = 24,
  bool isUpperText = true,
  bool isRadius = true,
  Color color = Colors.white, //---
  double width = double.infinity,
  TextStyle? style,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
              isRadius ? Radius.circular(radius) : Radius.zero)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          isUpperText ? text.toUpperCase() : text,
          style: style,
        ),
      ),
    );

Widget defaultTextFormField({
  required TextEditingController controller,
  required FormFieldValidator<String> validator,
  required String label,
  required IconData prefixIcon,
  GestureTapCallback? onTapSuffix,
  IconData? suffixIco,
  bool isRadius = true,
  bool isPassword = false,
  double radius = 24.0,
  TextInputType textType = TextInputType.text,
  GestureTapCallback? onTap,
  ValueChanged<String>? onChanged,
  ValueChanged<String>? onSubmitted,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: isRadius
          ? BorderRadius.all(Radius.circular(radius))
          : BorderRadius.zero,
    ),
    child: TextFormField(
      controller: controller,
      validator: validator,
      onTap: onTap,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      obscureText: isPassword,
      keyboardType: textType,
      decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          prefixIcon: Icon(prefixIcon),
          suffixIcon: IconButton(
            onPressed: onTapSuffix,
            icon: Icon(suffixIco),
          )),
    ),
  );
}

Widget defaultTextFormField2({
  required BuildContext context,
  required TextEditingController controller,
  required FormFieldValidator<String>? validator,
  required IconData prefix,
  ValueChanged<String>? onChanged,
  FormFieldSetter<String>? onSave,
  GestureTapCallback? onTap,
  GestureTapCallback? onTapSaffixIcon,
  Color colorBorder = Colors.green,
  Color colorEnabled = Colors.green,
  Color colorError = Colors.red,
  Color colorFocused = Colors.green,
  Color colorDisabled = Colors.grey,
  Color colorFill = Colors.transparent,
  bool isRadius = true,
  bool isPassword = false,
  bool enabled = true,
  double radius = 25.0,
  double widthBorder = 1,
  IconData? suffixIco,
  String? labelText,
  TextInputType textInputType = TextInputType.text,
}) {
  return TextFormField(
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius:  BorderRadius.all(isRadius ? Radius.circular(radius) : Radius.zero),
        borderSide:  BorderSide(
          color: colorBorder,
          width: 1.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius:  BorderRadius.all(isRadius ? Radius.circular(radius) : Radius.zero),
        borderSide:  BorderSide(
            color: colorError,
            width: widthBorder,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius:  BorderRadius.all(isRadius ? Radius.circular(radius) : Radius.zero),
        borderSide: BorderSide(
          color: colorEnabled,
          width: widthBorder,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius:  BorderRadius.all(isRadius ? Radius.circular(radius) : Radius.zero),
        borderSide: BorderSide(
          color: colorFocused,
          width: widthBorder,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.all(isRadius ? Radius.circular(radius) : Radius.zero),
        borderSide: BorderSide(
          color: colorFocused,
          width: widthBorder,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.all(isRadius ? Radius.circular(radius) : Radius.zero),
        borderSide: BorderSide(
          color: colorDisabled,
          width: widthBorder,
        ),
      ),
      enabled: true,
      prefixIcon: Icon(prefix),
      filled: true,
      fillColor: colorFill,
      suffix: InkWell(
        onTap: onTapSaffixIcon,
        child: Icon(suffixIco),
      ),
      labelText: labelText,
    ),
    controller: controller,
    onTap: onTap,
    validator: validator,
    keyboardType: textInputType,
    onSaved: onSave,
    onChanged: onChanged,
    obscureText: isPassword ? true : false,
  );
}

Widget defaultTextButton({
  required GestureTapCallback onPressed,
  required String label,
  bool isUpperText = true,
  TextStyle? labelStyle,
}) {
  return TextButton(
    onPressed: onPressed,
    child: Text(
      isUpperText ? label.toUpperCase() : label,
      style: labelStyle,
    ),
  );
}

Widget defaultAuthSign({
  bool isRadius = true,
  double height = 64.0,
  double width = 92.0,
  double radius = 20.0,
  double? size,
  Color color = Colors.blue,
  required IconData icon,
  required GestureTapCallback? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white, //---
        borderRadius: BorderRadius.all(
          isRadius ? Radius.circular(radius) : Radius.zero,
        ),
      ),
      child: Center(
        child: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    ),
  );
}

Widget defaultSwitch(
    {required bool value,
    required ValueChanged<bool> onChanged,
    Color activeColor = Colors.white70, //--
    bool isRadius = true,
    double radius = 20.0}) {
  return Switch(
    value: value,
    onChanged: onChanged,
    activeColor: activeColor,
    splashRadius: 80,
  );
}

Future<bool?> showToast({
  required String text,
  required ToastStatus status,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(status),
      fontSize: 14,
    );

enum ToastStatus {
  success,
  error,
  warning,
}

Color chooseToastColor(ToastStatus status) {
  Color color;
  switch (status) {
    case ToastStatus.success:
      color = Colors.green;
      break;
    case ToastStatus.error:
      color = Colors.red;
      break;
    case ToastStatus.warning:
      color = Colors.amber;
      break;
  }
  return color;
}

void navigatorTo({
  required BuildContext context,
  required Widget widget,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

void navigatorRemoved({
  required BuildContext context,
  required Widget widget,
}) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (route) => false,
  );
}

double widthPage({
  required BuildContext context,
}) =>
    MediaQuery.of(context).size.width;

double heightPage({required BuildContext context}) =>
    MediaQuery.of(context).size.height;
