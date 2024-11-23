import 'package:flutter/material.dart';
import 'package:flutter_application_2/recipe.dart';

class Detailpage extends StatefulWidget {
  final Recipe recipe;

  const Detailpage({super.key, required this.recipe});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  int _sliderVal = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image(image: AssetImage(widget.recipe.imageUrl)),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            widget.recipe.label,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 12,
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(7.0),
              itemCount: widget.recipe.ingredients.length,
              itemBuilder: (BuildContext context, int index) {
                final Ingredient = widget.recipe.ingredients[index];
                return Text('${Ingredient.quantity * _sliderVal} '
                    '${Ingredient.measure} '
                    '${Ingredient.name}');
              },
            ),
          ),
          Slider(
            min: 1,
            max: 10,
            divisions: 9,
            onChanged: (newvalue) {
              setState(() {
                _sliderVal = newvalue.round();
              });
            },
            value: _sliderVal.toDouble(),
            label: '${_sliderVal * widget.recipe.servings} servings',
            activeColor: Colors.green,
            inactiveColor: Colors.black,
          )
        ],
      )),
    );
  }
}
