import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({
    super.key, 
    required this.onValue
  });

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
          textController.clear();
          onValue( textValue );
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
        textController.clear();
        focusNode.requestFocus();
        onValue( value );
      },
    );
  }
}
