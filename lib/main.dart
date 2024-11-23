import 'package:flutter/material.dart';
import 'package:flutter_application_2/Detailpage.dart';
import 'recipe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'recip',
      theme: theme.copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent)),
      home: const recip(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class recip extends StatelessWidget {
  const recip({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('hi'),
        titleTextStyle: TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      body: SafeArea(
          child: Container(
        child: ListView.builder(
          itemCount: Recipe.swmples.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Detailpage(recipe: Recipe.swmples[index]);
                  }));
                },
                child: buildRecipeCard(Recipe.swmples[index]));
          },
        ),
      )),
    );
  }
}

Widget buildRecipeCard(Recipe recipe) {
  return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          Image(image: AssetImage(recipe.imageUrl)),
          SizedBox(
            height: 14,
          ),
          Text(
            recipe.label,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              fontFamily: 'Palatino',
            ),
          ),
        ]),
      ));
}
