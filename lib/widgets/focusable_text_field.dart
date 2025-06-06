import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../res/app_res.dart';

class FocusableTextField extends StatefulWidget {
  const FocusableTextField(
      {super.key, required this.initialText, required this.onTextChanged});

  final String initialText;
  final void Function(String) onTextChanged;

  @override
  State<FocusableTextField> createState() => _FocusableTextFieldState();
}

class _FocusableTextFieldState extends State<FocusableTextField> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textController = TextEditingController();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
    _textController.text = widget.initialText;
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    _textController.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(
          child: IntrinsicWidth(
            child: TextField(

              style: const TextStyle(color: AppColors.background, fontSize: 24),
              decoration: null,
              focusNode: _focusNode,
              controller: _textController,
              onChanged: (newValue) => widget.onTextChanged(newValue),
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        if (!_isFocused)
          SvgPicture.asset(
            AppIcons.icEdit,
            width: 44,
            height: 44,
            color: AppColors.background,
          ),
      ],
    );
  }
}
