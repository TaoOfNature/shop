import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

var styleInput = TextStyle(color: Colors.black, fontSize: 20);

class InputWidget extends StatelessWidget {
  final String labelText;
  final String helperText;
  final double borderRaius;

  const InputWidget({
    super.key,
    required this.labelText,
    this.helperText = "",
    this.borderRaius = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            obscureText: true,
            style: styleInput,
            keyboardType: TextInputType.visiblePassword,
            maxLength: 11,
            decoration: InputDecoration(
              labelText: labelText,
              helperText: helperText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRaius)),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  print("hah");
                },
                icon: const Icon(Icons.visibility),
              ),
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
    borderRaius: 10.0,
  );
}
