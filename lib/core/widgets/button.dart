import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    this.onTap,
    this.label,
    this.icon,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 5,
    ),
  }) : super(key: key);

  final VoidCallback? onTap;
  final String? label;
  final Icon? icon;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[300],
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        child: Container(
          padding: padding,
          child: Row(
            children: [
              if (icon != null) icon!,
              const SizedBox(width: 5),
              Text(
                label ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyWideButton extends StatelessWidget {
  const MyWideButton({
    Key? key,
    this.label,
    this.onTap,
  }) : super(key: key);

  final String? label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[300],
      borderRadius: const BorderRadius.all(
        Radius.circular(50),
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Center(
            child: Text(
              label ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
