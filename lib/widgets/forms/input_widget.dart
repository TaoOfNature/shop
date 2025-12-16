import 'package:flutter/material.dart';
import 'package:shop/widgets/forms/input_config.dart';

class InputWidget extends StatefulWidget {
  // --- 核心属性（必须） ---
  final TextEditingController controller; // 外部管理输入内容
  final String labelText;

  // --- TextField 必需属性 ---
  final TextInputType inputType;
  final int? maxLength; // 改为 nullable，如果不设置则不限制

  // --- 封装的配置对象 ---
  final InputConfig config;

  // --- 可选回调函数 ---
  final ValueChanged<String>? onChanged;

  const InputWidget({
    super.key,
    required this.controller,
    required this.labelText,
    required this.inputType,
    required this.config,
    this.maxLength,
    this.onChanged,
  });

  @override
  State<StatefulWidget> createState() => _InputWidgetState();
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
    // 1. 使用 FormField 代替裸露的 TextField，以便使用 validator
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        // 推荐使用 TextFormField 配合 Form 进行校验
        controller: widget.controller,
        obscureText: obscureText,
        style:
            widget.config.textStyle ??
            const TextStyle(color: Colors.black, fontSize: 16),
        keyboardType: widget.inputType,
        maxLength: widget.maxLength,
        autofocus: widget.config.autofocus,
        validator: widget.config.validator, // 使用配置对象中的 validator
        onChanged: widget.onChanged,

        // 2. 优化 Decoration 的构建
        decoration: InputDecoration(
          labelText: widget.labelText,
          helperText: widget.config.helperText, // 从 config 中获取
          counterText: (widget.maxLength != null)
              ? null
              : '', // 如果设置了 maxLength，则使用默认计数器
          // 优化边框
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.config.borderRadius), // 从 config 中获取
            ),
          ),

          // 优化焦点颜色 (示例：使用 ThemeData 的 primaryColor 或 config 的 focusColor)
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.config.borderRadius),
            ),
            borderSide: BorderSide(
              color: widget.config.focusColor ?? Theme.of(context).primaryColor,
              width: 2.0,
            ),
          ),

          // 密码图标逻辑保持不变
          suffixIcon: widget.inputType == TextInputType.visiblePassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
