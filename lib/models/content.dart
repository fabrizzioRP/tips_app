class ContentScreen {
  final int id;
  final String title, subtitle, image;

  const ContentScreen({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
  });
}

const List<ContentScreen> contentScreens = [
  ContentScreen(
    id: 1,
    title: 'Elige una Tecnologia',
    subtitle:
        'En el mundo de la tecnologia, existen muchas aeras en donde enfocarse al igual que los lenguajes de programacion. Existen muchas por ejemplo: Python, Java, C++, Php, Javascript, etc... Pero en este caso debemos elegir uno para comenzar.',
    image: 'lenguajes.png',
  ),
  ContentScreen(
    id: 2,
    title: 'Aprende Esa Tecnologia',
    subtitle:
        'Una vez tenemos seleccionada nuestro lenguaje de programacion es hora de investigar respecto a este. Actualmente exiten muchos recursos de donde aprender por ejemplo: Youtube, Plataformas de aprendizaje como Udemy, Platzi o revisando la documentacion del lenguaje.',
    image: 'aprender.png',
  ),
  ContentScreen(
    id: 3,
    title: 'Crea Proyectos Interesantes',
    subtitle:
        'Una vez tenemos bien las bases sobre ese lenguaje es hora de comenzar a realizar proyectos. Esto ayudara demasiado a comprender mejor el lenguaje y mejorar nuestra logica de programacion. Tambien se siente super porque son proyectos propios.',
    image: 'crear.png',
  ),
];
