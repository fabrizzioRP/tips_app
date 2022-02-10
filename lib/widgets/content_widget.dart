import 'package:flutter/material.dart';
import 'package:options_app/models/content.dart';

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    Key? key,
    required this.size,
    required this.contenido,
  }) : super(key: key);
  final Size size;
  final ContentScreen contenido;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 70),
      padding: const EdgeInsets.all(20.0),
      width: size.width,
      height: size.height,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/${contenido.image}'),
          Text(
            contenido.title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            contenido.subtitle,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
