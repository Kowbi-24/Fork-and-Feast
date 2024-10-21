import 'package:flutter/material.dart';
import 'package:food_order_system/model/transaction.dart';
import 'package:food_order_system/view/payment_option_page.dart';
import 'package:food_order_system/util/back_arrow_icon.dart';



class DiningLocation extends StatefulWidget {

  Transaction currentTransaction;
  
  DiningLocation({super.key, required this.currentTransaction});

  @override
  _DiningLocationState createState() => _DiningLocationState();
}

class _DiningLocationState extends State<DiningLocation> {
  String? diningOption;
  bool isButtonClicked = false;
  int currentSelected = 0;

  void changeSelected(int selectedIndex){
    setState(() {
      currentSelected = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: BackArrowIcon(
          backgroundColor: Color.fromARGB(255, 5, 59, 80),
          iconColor: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Dining Location',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 16,),
            child: Column(
              children: [
                OptionContainer(
                  icon: Icons.restaurant,
                  option: 'Dine-In',
                  currentSelected: currentSelected,
                  index: 0,
                  onPressed: () => changeSelected(0),
                ),
                
                SizedBox(height: 20),
                
                OptionContainer(
                  icon: Icons.shopping_bag,
                  option: 'Pick-Up',
                  currentSelected: currentSelected,
                  index: 1,
                  onPressed: () => changeSelected(1),
                ),
                

                Spacer(),

                ElevatedButton(
                  onPressed: (){

                    if (currentSelected == 0){
                      widget.currentTransaction.diningLocation = "Dine in";
                    }
                    else{
                      widget.currentTransaction.diningLocation = "Pick up";
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentOptionPage()),
                    );


                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 5, 59, 80),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('Next',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      )),
                ),
                SizedBox(height: 20),
              ],
              
            ),
          ),
          
        ],
      ),
    );
  }
}

//try lang for option onPressed purposes
class OptionContainer extends StatelessWidget {
  final IconData icon;
  final String option;
  final int currentSelected;
  final int index;
  final Function onPressed;

  const OptionContainer({
    required this.icon,
    required this.option,
    required this.currentSelected,
    required this.index,
    required this.onPressed
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 120,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 5, // Shadow depth
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        onPressed: () => onPressed(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(icon),
              SizedBox(width: 20),
              Text(
                option,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Spacer(),
              CircleAvatar(
                radius: 12,
                backgroundColor:
                    currentSelected == index ? Color.fromARGB(255, 5, 59, 80) : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}