import 'package:flutter/material.dart';
import 'package:food_order_system/model/food.dart';
import 'package:food_order_system/model/transaction.dart';

class CartItem extends StatefulWidget {
  Food food;
  int quantity;
  Transaction currentTransaction;
  int index;
  Function removeItem;
  Function newTotalPrice;

  CartItem({
    required this.food,
    required this.quantity,
    required this.currentTransaction,
    required this.index,
    required this.removeItem,
    required this.newTotalPrice,
  });

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {

  @override

  void _incrementQuantity() {
    setState(() {
      widget.quantity++;
      widget.currentTransaction.listFood[widget.food] = (widget.currentTransaction.listFood[widget.food] ?? 0) + 1;      
      widget.currentTransaction.getTotalPrice();

      widget.newTotalPrice(widget.currentTransaction.totalPrice);
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (widget.quantity > 1) {
        widget.quantity--;
        widget.currentTransaction.listFood[widget.food] = (widget.currentTransaction.listFood[widget.food] ?? 0) - 1;
        widget.currentTransaction.getTotalPrice();

        widget.newTotalPrice(widget.currentTransaction.totalPrice);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 5),
      child: Container(
        height: 115,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0.0, 8.0),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Padding(padding: EdgeInsets.only(right: 5),
                child:Container(
                  child: Image.asset("lib/images/food_images/${widget.food.imgPath}",
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            widget.food.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                          iconSize: 15,
                          onPressed: (){
                            // Remove item -> Update total price -> Set state total price
                            widget.removeItem(widget.index);
                            widget.currentTransaction.getTotalPrice();
                            widget.newTotalPrice(widget.currentTransaction.totalPrice);
                            },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              "₱ ${(widget.food.price * widget.quantity).toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                        ),

                        Container(
                          height: 25,
                          decoration: BoxDecoration(
                            color: const Color(0xFF043447),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              children: [
                                IconButton(
                                  padding: const EdgeInsets.all(3),
                                  alignment: Alignment.center,
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 10,
                                    color: Colors.white,
                                  ),
                                  onPressed: _decrementQuantity,
                                ),
                                SizedBox(
                                  width: 15,
                                  child: Text(
                                    "${widget.quantity}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  padding: const EdgeInsets.all(3),
                                  icon: const Icon(
                                    Icons.add,
                                    size: 10,
                                    color: Colors.white,
                                  ),
                                  onPressed: _incrementQuantity,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}

