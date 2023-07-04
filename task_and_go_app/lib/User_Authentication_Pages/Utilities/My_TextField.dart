import 'package:flutter/material.dart';
import 'package:task_and_go_app/Widgets/constraints.dart';
class EntryTextField extends StatefulWidget {
  const EntryTextField({
    Key? key,
    required this.textController,
    required this.hintText,
    required this.obscureText,
    this.icon,
    required this.validationFunction,
  }) : super(key: key);

  final TextEditingController textController;
  final String hintText;
  final bool obscureText;
  final IconData? icon;
  final String? Function(String?) validationFunction;

  @override
  _EntryTextFieldState createState() => _EntryTextFieldState();
}

class _EntryTextFieldState extends State<EntryTextField> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        cursorColor: Colors.black,
        controller: widget.textController,
        obscureText: widget.obscureText && !_showPassword,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color(0xffF2F1F8)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: border_color),
          ),
          fillColor: const Color(0xffffffff),
          filled: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.black38),
          suffixIcon: widget.obscureText
              ? InkWell(
            onTap: () {
              setState(() {
                _showPassword = !_showPassword;
              });
            },
            child: Icon(
              _showPassword ? Icons.visibility : Icons.visibility_off,
              color: _showPassword ? Colors.blue : Colors.grey,
            ),
          )
              : null,
        ),
        style: Theme.of(context).textTheme.titleMedium,
        validator: widget.validationFunction,
        autovalidateMode:AutovalidateMode.onUserInteraction,
        onChanged: (value) => setState(() {}),
      ),
    );
  }
}




