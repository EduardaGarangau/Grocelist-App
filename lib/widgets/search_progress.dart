import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SearchAndProgress extends StatelessWidget {
  final Function(String) setFilter;
  final String filter;
  final int itemsChecked;
  final int listLength;

  const SearchAndProgress({
    Key? key,
    required this.setFilter,
    required this.itemsChecked,
    required this.listLength,
    required this.filter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: TextField(
            onChanged: setFilter,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
            ),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(filter.isEmpty ? Icons.search : Icons.clear),
                color: Colors.white,
                onPressed: filter.isNotEmpty ? () => setFilter('') : () {},
              ),
              hintText: 'Search...',
              hintStyle: const TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.white,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: CircularPercentIndicator(
            radius: 30,
            lineWidth: 6,
            percent: listLength == 0 ? 0 : itemsChecked / listLength,
            animation: true,
            progressColor: Colors.green,
            backgroundColor: Colors.white,
            animateFromLastPercent: true,
            animationDuration: 500,
            center: Text(
              '$itemsChecked/$listLength',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
