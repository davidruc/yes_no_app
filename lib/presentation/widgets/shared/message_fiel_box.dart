import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();

    final colors = Theme.of(context).colorScheme;

    final focusNode = FocusNode();

    final outlinedInputBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: colors.primary),
        borderRadius: BorderRadius.circular(20));

    final inputDecoration = InputDecoration(
      hintText: "End your message with an '?'",
      enabledBorder: outlinedInputBorder,
      focusedBorder: outlinedInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          print("valor de la caja de texto: $textValue");
          textController.clear();
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      // cuando un elemento sea de tipo focusNode, nosotros le podemos poner objeto de tipo FocusNode
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print("Submit value $value");
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
