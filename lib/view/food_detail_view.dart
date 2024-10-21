import 'package:flutter/material.dart';
import 'package:food_order_system/model/food.dart';
import 'package:food_order_system/view/home_page.dart';
import 'package:food_order_system/model/boxes.dart';
import 'package:food_order_system/util/back_arrow_icon.dart';

class FoodDetailView extends StatefulWidget{
  Food food;
  FoodDetailView({
    super.key,
    required this.food,
  });

  State<StatefulWidget> createState() => _FoodDetailViewState(food: food,);
}


class _FoodDetailViewState extends State<FoodDetailView>{

  final Food food;
  int quantity = 1;

  _FoodDetailViewState({
    required this.food,
  });


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: BackArrowIcon(
          backgroundColor: Color.fromARGB(255, 5, 59, 80),
          iconColor: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
              "Details",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Spacer(),
      
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 50),
            child: Image.asset(
              "lib/images/food_images/${food.imgPath}",
              scale: 3.5,
            ),
          ),
      
          const Spacer(),
      
      
          Container(
            width: double.infinity,
            height: 350,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 5, 59, 80),
              boxShadow: [BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 10,
                blurRadius: 10,
              ),]
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "₱ ${food.price * quantity}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
          
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      food.description,
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
          
          
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      width: 130,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 115, 159, 174),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              setState(() {
                                if (quantity > 1){
                                  quantity -= 1;
                                }
                              });
                            },
                            child: Icon(Icons.remove, color: Colors.black,),
                            minWidth: 10,
                          ),
                      
                          Text(quantity.toString(), style: TextStyle(color: Colors.black),),
                      
                          MaterialButton(
                            onPressed: () {
                              setState(() {
                                if (quantity < 99){
                                    quantity += 1;
                                }
                              });
                            },
                            child: Icon(Icons.add, color: Colors.black,),
                            minWidth: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
          
                  Spacer(),
          
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      height: 50,
                      width: 400,
                      buttonColor: Colors.white,
                      buttonBorderColor: Color.fromARGB(255, 5, 59, 80),
                      buttonText: "Add to Cart",
                      textColor: Colors.black,
                      //onPressed: () => updateTransaction,
                      onPressed: () {
                        currentTransaction.listFood[food] = quantity;
                        print(currentTransaction.listFood);
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
          
                
              ),
            ),
          ),
      
        ],
      ),
    );
  }
}




class CustomButton extends StatelessWidget{

  double height;
  double width;
  Color buttonColor;
  Color buttonBorderColor;
  String buttonText;
  Color textColor;
  Function() onPressed;

  CustomButton({
    super.key,
    required this.height,
    required this.width,
    required this.buttonColor,
    required this.buttonBorderColor,
    required this.buttonText,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            side: BorderSide(
              width: 1,
              color: buttonBorderColor,
            ),
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColor,
              fontSize: 15
            ),
          ),
        ),
      ),
    );
  }
}