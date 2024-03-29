// usando el atajo material crea un cascaron de la app automáticamente
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // de esta forma creo los providers a un nivel de scope global
      providers: [
        ChangeNotifierProvider(create: (_)=> ChatProvider())
      ],
      child: MaterialApp(
        title: 'yes no app',
        debugShowCheckedModeBanner: false,
        theme: AppTheme( selectedColor: 5).theme(),
        home: const ChatScreen(),
      ),
    );
  }
}