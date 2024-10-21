// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_order_system/model/boxes.dart';
import 'package:food_order_system/model/food.dart';
import 'package:food_order_system/model/transaction.dart';
import 'package:food_order_system/view/cart.dart';
import 'package:food_order_system/view/see_all.dart';
import 'package:food_order_system/util/bottom_bar.dart';
import 'package:food_order_system/util/category_button.dart';
import 'package:food_order_system/util/food_container.dart';
import 'package:food_order_system/util/side_bar.dart';

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => HomePageState();

  List db_profile = [
    "Djohn Paul Turla",
    "0909472351",
    "turlaBells@gmail.com",
    "profile_picture.jpg",
    "password",
    500.0
  ];
}

class HomePageState extends State<HomePage> {
  List listButtons = [
    [Icon(Icons.restaurant), "Meal", true],
    [Icon(Icons.liquor), "Drinks", false],
    [Icon(Icons.fastfood), "Sides", false],
    [Icon(Icons.cake), "Dessert", false],
  ];

  List listMeal = [
    Food(102, "Chicken Cordon Bleu", "Crispy breaded chicken breast stuffed with ham and melted cheese.", "chickenCordonBleu.png", 300.00),
    Food(103, "Pan Seared Salmon", "Fresh salmon fillet, perfectly seared with a golden crust.", "pan seared salmon.png", 229.99),
    Food(104, "Charlie Chan", "Creamy pasta with a hint of Asian flavors, tossed with tender chicken and shiitake mushrooms.", "charlieChan.png", 150.00),
    Food(105, "Fettuccine Alfredo", "Smooth and creamy Alfredo sauce over fettuccine pasta.", "fettuccine alfredo.png", 170.00),
    Food(107, "Truffle Mushroom Pasta", "Earthy truffle and mushroom flavors blended in a creamy sauce.", "truffle mushroom pasta.png", 200.00),
    Food(102, "Sisig", "Chicken & Ham", "sisig.png", 300.00),
  ];

  List listDrinks = [
    Food(201, "Biscoff Latte", "Smooth espresso with creamy Biscoff cookie flavor.", "biscoff latte.png", 130.25),
    Food(202, "Seasalt Latte", "Creamy latte with a hint of sea salt to elevate the flavor.", "seasalt latte.png", 182),
    Food(203, "Matcha Latte", "Earthy green tea matcha blended with milk for a smooth finish.", "matcha latte.png", 164.50),
    Food(205, "Cappuccino", "A fusion of matcha and espresso for a bold and unique taste.", "cappucino.png", 150),
    Food(206, "White Mocha", "Sweet, creamy white chocolate combined with espresso.", "white mocha.png", 130.00),
    Food(207, "Oreo Latte", "Creamy blend of Oreo cookies with rich espresso.", "oreo latte.png", 120),
    Food(207, "Cucumber Lemonade", "Freshly made cucumber with a perfect mixture of lemonate for a refreshing taste", "cucumber lemonade.png", 145),
    Food(207, "Iced Tea", "Your old and reliable home-made iced tea", "iced tea.png", 190),
  ];

  List listSides = [
    Food(301, "Calamaris", "Crispy fried squid rings served with a tangy dipping sauce.", "calamaris.png", 149.75),
    Food(301, "Burger", "A home-made hamburger with freshly made buns and beef patty", "borgir.png", 240),
    Food(102, "Tacos", "Tacos with deliciously made exquisite tomato sauce and more", "tacos.png", 300),
    Food(402, "Potato Croquettes", "Creamy mashed potato bites, breaded and fried until golden.", "potato croquettes.png", 170),
    Food(302, "Mozzarella Sticks", "Golden-fried mozzarella with a gooey, melted center.", "mozzarella sticks.png", 129.75),
    Food(303, "Clubhouse Sandwich", "Layers of ham, turkey, bacon, and cheese in a classic club sandwich.", "clubhouse sandwich.png", 180.25),
    Food(304, "Loaded Fries", "Crispy fries topped with cheese, bacon bits, and other tasty toppings.", "loaded fries.png", 129),
  ];

  List listDesserts = [
    Food(402, "Waffle De Kevin", "Exquisite French-style waffles handmade by our world-class chefs", "waffleDeKevin.png", 150),
    Food(401, "Biscoff Cheesecake", "Creamy cheesecake infused with the flavor of Biscoff cookies.", "biscoff cheesecake.png", 170),
    Food(402, "New York Cheesecake", "Classic, rich, and smooth cheesecake with a graham cracker crust.", "new york cheesecake.png", 130),
    Food(403, "Halo Halo", "The iconic Filipino dessert with icecream specially selected by our chefs", "halo halo.png", 150),
    Food(402, "Red Velvet", "Moist, vibrant red cake layered with cream cheese frosting.", "Red velvet cake.png", 190),
    Food(402, "Tiramisu", "Layers of coffee-soaked ladyfingers with mascarpone cream.", "tiramisu.png", 280),
  ];

  List displayedFood = [];
  String currentFoodTypeSelected = "Meal";
  TextEditingController searchController = TextEditingController();
  List allFood = []; // To store all food items for search functionality

  @override
  void initState() {
    super.initState();
    displayedFood = List.from(listMeal);
    allFood = [...listMeal, ...listDrinks, ...listSides, ...listDesserts];
    
    // Add listener to search bar
    searchController.addListener(_filterFood);
  }

  void _filterFood() {
    setState(() {
      String query = searchController.text.toLowerCase();
      
      // If search query is not empty, filter the food list
      if (query.isNotEmpty) {
        displayedFood = allFood
            .where((food) =>
                food.name.toLowerCase().contains(query) ||
                food.description.toLowerCase().contains(query))
            .toList();
      } else {
        // If search bar is cleared, show the food items for the currently selected category
        _updateDisplayedFood();
      }
    });
  }

  void _updateDisplayedFood() {
    if (currentFoodTypeSelected == "Meal") {
      displayedFood = listMeal;
    } else if (currentFoodTypeSelected == "Drinks") {
      displayedFood = listDrinks;
    } else if (currentFoodTypeSelected == "Sides") {
      displayedFood = listSides;
    } else if (currentFoodTypeSelected == "Dessert") {
      displayedFood = listDesserts;
    }
  }

  void categoryButtonPress(int index) {
    setState(() {
      for (List button in listButtons) {
        button[2] = false;
      }
      listButtons[index][2] = true;
      currentFoodTypeSelected = listButtons[index][1];
      _updateDisplayedFood();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 5, 59, 80),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Fork & Feast",
          style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      drawer: SideBar(
        accountBalance: HomePage().db_profile[5],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 5, 59, 80),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 10,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: "Search food...",
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        //borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                    left: 8,
                    right: 8,
                  ),
                  child: SizedBox(
                    height: 50,
                    child: ListView.builder(
                      itemCount: listButtons.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CategoryButton(
                          icon: listButtons[index][0],
                          buttonName: listButtons[index][1],
                          isFocused: listButtons[index][2],
                          onPressed: () {
                            categoryButtonPress(index);
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3.0,
                  mainAxisSpacing: 3.0,
                  childAspectRatio: 0.9,
                ),
                itemCount: displayedFood.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FoodContainer(
                      food: displayedFood[index],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          currentTransaction.getTotalPrice();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Cart()),
          );
        },
        child: Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
        shape: CircleBorder(),
        backgroundColor: Color.fromARGB(255, 23, 107, 135),
      ),
    );
  }
}
