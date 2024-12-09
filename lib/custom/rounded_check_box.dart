import 'package:flutter/material.dart';
class RoundedCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const RoundedCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  _RoundedCheckboxState createState() => _RoundedCheckboxState();
}

class _RoundedCheckboxState extends State<RoundedCheckbox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      borderRadius: BorderRadius.circular(12), // Đảm bảo bo góc
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: widget.value ? Colors.teal : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: widget.value ? Colors.teal : Colors.grey,
            width: 2,
          ),
        ),
        child: widget.value
            ? const Icon(
                Icons.check,
                size: 16,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
