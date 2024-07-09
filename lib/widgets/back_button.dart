import 'package:byb/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return IconButton(
        color: themeProvider.getCurrentTheme() ? Colors.white : Colors.black,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Iconsax.arrow_circle_left));
  }
}
