import 'package:flutter/material.dart';
import 'package:food_order_system/model/food.dart';
import 'package:food_order_system/view/food_detail_view.dart';
import 'package:food_order_system/view/home_page.dart';


class FoodContainer extends StatelessWidget{

  Food food;


  FoodContainer({
    super.key,
    required this.food,
  });

  @override
  Widget build(BuildContext context){
    return MaterialButton(
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FoodDetailView(food: food,))
        );
      },
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: Column(
            children: [
              Image.asset(
                "lib/images/food_images/${food.imgPath}",
                scale: 9,
              ),
              Text(
                food.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                food.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey
                ),
                overflow: TextOverflow.ellipsis,
              ), 
              Spacer(),
              Text(
                "₱ ${food.price}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  color: Color.fromARGB(255, 23, 107, 135)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}