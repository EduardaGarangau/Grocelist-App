import 'package:flutter/material.dart';

class ListButtons extends StatelessWidget {
  const ListButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
        top: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            width: 150,
            child: ElevatedButton(
              child: const Text(
                'Add',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 20),
          SizedBox(
            height: 40,
            width: 150,
            child: ElevatedButton(
              child: const Text(
                'Delete All',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).errorColor,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
