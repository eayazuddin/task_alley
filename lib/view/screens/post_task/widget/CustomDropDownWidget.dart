import 'package:flutter/material.dart';

class CustomDropDownWidget extends StatefulWidget {
  final String hint;
  final String? label;
  final List<String> items;
  final String? initialValue;
  final Function(String) onChanged;
  final FormFieldValidator<String>? validator; //  Added for validation

  const CustomDropDownWidget({
    super.key,
    this.hint = "Select Option",
    required this.items,
    this.initialValue,
    required this.onChanged,
    this.label,
    this.validator,
  });

  @override
  State<CustomDropDownWidget> createState() => _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState extends State<CustomDropDownWidget> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Label above dropdown
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              widget.label!,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),

        /// Dropdown with FormField support
        DropdownButtonFormField<String>(
          value: _selectedValue,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFE6F4F1),
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          hint: Text(
            widget.hint,
            style: TextStyle(
              color: const Color(0xFF6B7280),
              fontSize: width * 0.04,
              fontWeight: FontWeight.w500,
            ),
          ),
          items: widget.items
              .map(
                (item) => DropdownMenuItem(
              value: item,
              child: Text(
                item,
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
          )
              .toList(),
          onChanged: (value) {
            setState(() => _selectedValue = value);
            widget.onChanged(value!);
          },
          validator: widget.validator, // 👈 Validation hook
        ),
      ],
    );
  }
}
