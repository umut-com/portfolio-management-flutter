import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final TextEditingController? controller;
  final Icon? icon;
  final IconButton? suffixIcon;
  final Function(String?)? onSaved;
  final void Function(String)? onChangedCallback;
  final Color? iconColor;
  final Color fillColor;
  final bool obscureText;
  final double borderRadius;
  final bool showDatePicker;
  final bool readOnly;
  final int? minLines;
  final int? maxLines;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final InputDecoration? decoration;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.controller,
    this.icon,
    this.onSaved,
    this.minLines,
    this.maxLines,
    this.onChangedCallback,
    this.iconColor,
    this.fillColor = Colors.white,
    this.obscureText = false,
    this.borderRadius = 12.0,
    this.showDatePicker = false,
    this.readOnly = false,
    this.validator,
    this.keyboardType,
    this.decoration,
    this.suffixIcon,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override

  // TextEditingController'ı bu sınıfta tanımlamıyoruz.
  late TextEditingController _internalController;
  late ValueNotifier<String> _notifier;
  DateTime? _selectedDate;
  bool _showDatePicker = false;
  void initState() {
    // TODO: implement initState
    super.initState();
    _internalController = widget.controller ?? TextEditingController();
    _notifier = ValueNotifier<String>(_internalController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: TextFormField(
        controller: widget
            .controller, // Burada dışarıdan geçirilen TextEditingController'ı kullanıyoruz
        enabled: !_showDatePicker && !widget.readOnly,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        onTap: () => _selectDate(context),
        readOnly: widget.readOnly,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          border: InputBorder.none,
          filled: true,
          fillColor: widget.fillColor,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 4.0),
            child: widget.icon,
          ),
          suffix: Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 4.0),
            child: widget.suffixIcon,
          ),
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: widget.iconColor ??
                Theme.of(context).textTheme.bodyText1!.color,
          ),
        ),
        onSaved: widget.onSaved,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        textCapitalization: widget.textCapitalization!,
        onChanged: (value) {
          // Güncellenen değeri başka bir yerde kullanmak istiyorsanız burada kullanabilirsiniz.
          // Örneğin, bir state güncellemesi yapabilirsiniz.
          print("Güncellenen değer: $value");

          // Cursor'ı sona konumlandır

          // ValueNotifier ile güncellenen değeri dinleyicilere bildir
          _notifier.value = value;

          // onChangedCallback'i çağır
          if (widget.onChangedCallback != null) {
            widget.onChangedCallback!(value);
            _internalController.selection = TextSelection.fromPosition(
              TextPosition(offset: _internalController.text.length),
            );
          }
        },
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    if (widget.showDatePicker) {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: Colors.red,
              colorScheme: ColorScheme.fromSwatch().copyWith(
                secondary: Colors.yellow,
              ),
            ),
            child: child!,
          );
        },
      );

      if (pickedDate != null && pickedDate != _selectedDate) {
        setState(() {
          _selectedDate = pickedDate;
          widget.controller!.text = _selectedDate!.toString().split(' ')[0];
        });
      }
    } else {
      setState(() {
        _showDatePicker = false;
      });
    }
  }
}
