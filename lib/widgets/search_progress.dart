import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SearchAndProgress extends StatefulWidget {
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
  State<SearchAndProgress> createState() => _SearchAndProgressState();
}

class _SearchAndProgressState extends State<SearchAndProgress> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: TextField(
            controller: _controller,
            onChanged: widget.setFilter,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
            ),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(widget.filter.isEmpty ? Icons.search : Icons.clear),
                color: Colors.white,
                onPressed: widget.filter.isNotEmpty
                    ? () {
                        widget.setFilter('');
                        _controller.text = '';
                        FocusManager.instance.primaryFocus?.unfocus();
                      }
                    : () {},
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
            percent: widget.listLength == 0
                ? 0
                : widget.itemsChecked / widget.listLength,
            animation: true,
            progressColor: Colors.green,
            backgroundColor: Colors.white,
            animateFromLastPercent: true,
            animationDuration: 500,
            center: Text(
              '${widget.itemsChecked}/${widget.listLength}',
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
