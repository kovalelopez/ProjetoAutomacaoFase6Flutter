import 'package:fase_6/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AddShoppingListPage extends StatefulWidget {
  const AddShoppingListPage({super.key});

  @override
  State<AddShoppingListPage> createState() => _AddShoppingListPageState();
}

class _AddShoppingListPageState extends State<AddShoppingListPage> {
  final nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>()!;
    final isDark = theme.brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? null : appColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Nome da lista",
                      hintStyle:
                          isDark ? const TextStyle(color: Colors.black) : null,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    style: isDark ? const TextStyle(color: Colors.black) : null,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildCancelButton(context),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: _buildCreateButton(context, isDark, appColors),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  TextButton _buildCancelButton(BuildContext ctx) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: const BorderSide(
              color: Colors.white,
            ),
          ),
        ),
        overlayColor: MaterialStateProperty.all(Colors.white.withOpacity(.1)),
      ),
      onPressed: () {
        Navigator.of(ctx).pop();
      },
      child: const Text(
        "Voltar",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  TextButton _buildCreateButton(
      BuildContext ctx, bool isDark, AppColors appColors) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        backgroundColor: isDark ? appColors.primaryColor : Colors.white,
        foregroundColor: isDark ? Colors.white : null,
      ),
      onPressed: () {
        if (nameController.text.isNotEmpty) {
          Navigator.of(ctx).pop(nameController.text);
        }
      },
      child: const Text(
        "Criar",
      ),
    );
  }
}
