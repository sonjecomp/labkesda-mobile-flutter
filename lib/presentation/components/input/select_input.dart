import 'package:flutter/material.dart';
import 'package:labkesda_mobile/presentation/components/buttons/direct_button.dart';

class SelectInput extends StatefulWidget {
  final List<String> items;
  final String label;
  final String? placeholder;
  const SelectInput(
      {Key? key, required this.items, required this.label, this.placeholder})
      : super(key: key);

  @override
  State<SelectInput> createState() => _SelectInputState();
}

class _SelectInputState extends State<SelectInput> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFFF7F7F7),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          DropdownButtonFormField<String>(
            value: _selectedItem,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              filled: true,
              fillColor: const Color(0xFFF7F7F7),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              hintText: widget.placeholder,
            ),
            items: widget.items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? selectedItem) {
              setState(() {
                _selectedItem = selectedItem;
              });
            },
          ),
          const SizedBox(
            height: 60,
          ),
          const DirectButton(
            text: "LANJUTKAN",
          ),
        ],
      ),
    );
  }
}
