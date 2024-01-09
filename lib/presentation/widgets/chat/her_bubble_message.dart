import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({
    super.key, 
    required this.message
  });
  final Message message;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20)
          ),
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              message.text, 
              style: const TextStyle(color: Colors.white)
            ),
          ),
        ),
        const SizedBox( height: 5),
  
        _ImageBubble(imageUrl: message.imageUrl!),
        const SizedBox(height: 10)
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {

  const _ImageBubble({required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
   
    final size = MediaQuery.of(context).size;
  //Una forma para ver información del dispositivo donde estoy haciendo todo es usando el media query para conocerlo. Creo un breakpoint antes de return y doy un full restart, luego solo pongo el cursor sobre el size y ya tengo la información. 



    //clipRRect es un widget que nos permite crear border redondeados
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: size.height * 0.2,
        fit: BoxFit.cover,
        // Builder significa algo que se ejecuta en tiempo de ejecución
        loadingBuilder: (context, child, loadingProgress) {

          if( loadingProgress == null ) return child;

          return Container(
            width: size.width * 0.7,
            height: size.width * 0.2,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text("Adriana Grande está enviando una imagen"),
            
          );
        },
      )
    );
  }
}