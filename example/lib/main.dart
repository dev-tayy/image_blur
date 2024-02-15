import 'package:flutter/material.dart';
import 'package:image_blur/image_blur.dart';
import 'package:t3/home.dart';

void main() async {
  await ImageBlur.init(removeCacheTime: 10);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const List<String> imageUrls = <String>[
    "https://img.freepik.com/free-photo/nature-tranquil-beauty-reflected-calm-water-generative-ai_188544-12798.jpg?size=626&ext=jpg&ga=GA1.1.8332681.1703272078&semt=ais",
    "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg?size=626&ext=jpg&ga=GA1.1.8332681.1703272078&semt=ais",
    "https://img.freepik.com/free-photo/forest-landscape_71767-127.jpg?size=626&ext=jpg&ga=GA1.1.8332681.1703272078&semt=ais",
    "https://img.freepik.com/free-photo/natures-beauty-reflected-tranquil-mountain-waters-generative-ai_188544-7867.jpg?size=626&ext=jpg&ga=GA1.1.8332681.1703272078&semt=ais",
    "https://img.freepik.com/free-photo/snowy-mountain-peak-starry-galaxy-majesty-generative-ai_188544-9650.jpg?size=626&ext=jpg&ga=GA1.1.8332681.1703272078&semt=ais",
    "https://img.freepik.com/free-photo/forest-landscape_71767-127.jpg?size=626&ext=jpg&ga=GA1.1.8332681.1703272078&semt=ais",
    "https://img.freepik.com/free-photo/autumn-season-leafs-plant-scene-generative-ai_188544-7971.jpg?size=626&ext=jpg&ga=GA1.1.8332681.1703272078&semt=ais",
    "https://img.freepik.com/free-photo/autumn-leaf-falling-revealing-intricate-leaf-vein-generated-by-ai_188544-9869.jpg?size=626&ext=jpg&ga=GA1.1.8332681.1703272078&semt=ais",
    "https://img.freepik.com/free-photo/glowing-lines-human-heart-3d-shape-dark-background-generative-ai_191095-1435.jpg?size=626&ext=jpg&ga=GA1.1.8332681.1703272078&semt=ais",
    "https://img.freepik.com/free-photo/neon-tropical-monstera-leaf-banner_53876-138943.jpg?size=626&ext=jpg&ga=GA1.1.8332681.1703272078&semt=ais",
    "https://img.freepik.com/free-photo/vibrant-colors-flow-abstract-wave-pattern-generated-by-ai_188544-9781.jpg?size=626&ext=jpg&ga=GA1.1.8332681.1703272078&semt=ais",
    "https://img.freepik.com/free-photo/nighttime-nature-landscape-galaxy-mountain-water-star-beauty-generative-ai_188544-9736.jpg?size=626&ext=jpg&ga=GA1.1.8332681.1703272078&semt=ais",
    "https://img.freepik.com/free-photo/lake-mountains_1204-502.jpg?size=626&ext=jpg&ga=GA1.1.8332681.1703272078&semt=ais",
    "https://img.freepik.com/free-photo/vibrant-autumn-maple-leaves-nature-beauty-showcased-generated-by-ai_188544-15039.jpg?size=626&ext=jpg&ga=GA1.1.8332681.1703272078&semt=ais",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Test"),
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 3,
              mainAxisSpacing: 3,
              mainAxisExtent: 120,
            ),
            itemCount: imageUrls.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ImageBlur.imageHashPreview(
                  imagePath: imageUrls[index],
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Home()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
