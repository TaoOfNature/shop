import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:logging/logging.dart';

var styleInput = TextStyle(color: Colors.black, fontSize: 20);
var log = Logger("input");

class InputWidget extends StatefulWidget {
  final String labelText;
  final String helperText;
  final double borderRaius;
  final TextInputType inputType;
  final int maxLength;

  const InputWidget({
    super.key,
    required this.labelText,
    required this.inputType,
    required this.maxLength,
    this.helperText = "",
    this.borderRaius = 10.0,
  });

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  late bool obscureText;
  @override
  void initState() {
    super.initState();
    obscureText = widget.inputType == TextInputType.visiblePassword;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            obscureText: obscureText,
            style: styleInput,
            keyboardType: widget.inputType,
            maxLength: widget.maxLength,
            decoration: InputDecoration(
              labelText: widget.labelText,
              helperText: widget.helperText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRaius),
                ),
              ),
              suffixIcon: widget.inputType == TextInputType.visiblePassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                          log.info("status: $obscureText");
                        });
                      },
                      icon: obscureText
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}

@Preview()
Widget editText() {
  return InputWidget(
    labelText: "input text",
    helperText: "helper text",
    inputType: TextInputType.visiblePassword,
    maxLength: 100,
    borderRaius: 10.0,
  );
}
