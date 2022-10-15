import 'package:flutter/material.dart';

class ListEmptyWidget extends StatelessWidget {
  const ListEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.shopping_cart,
            color: Colors.white,
            size: 80,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(1, 1),
              ),
            ],
          ),
          Text(
            'Empty List',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 30,
              shadows: [
                Shadow(
                  color: Colors.black,
                  offset: Offset(1, 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
