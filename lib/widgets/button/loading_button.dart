import 'package:flutter/material.dart';
import 'package:genremusik/shared/theme.dart';

class ButtonLoading extends StatelessWidget {
  final IconData icon;

  const ButtonLoading({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: priceColor,
          minimumSize: const Size.fromHeight(50),
        ),
        child: buildContent(),
        onPressed: () {},
      );

  Widget buildContent() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 28),
          const SizedBox(width: 16),
          SizedBox(
            width: 24,
            height: 24,
            child: const CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation(
                Colors.grey,
              ),
            ),
          ),
        ],
      );
}
