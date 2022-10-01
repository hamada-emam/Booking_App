import 'package:flutter/material.dart';

class DetailsRate extends StatelessWidget {
  final String rate;
  const DetailsRate({Key? key, required this.rate}) : super(key: key);
  Widget buildDivider(double endIndent) {
    return Container(
      width: endIndent,
      height: 3.5,
      color: Colors.blue.shade800,
    );
  }

  final List<String> rates = const ["Room", "Services", "Location", "Price"];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                rate,
                style: TextStyle(
                    color: Colors.blue.shade800,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 50,
              ),
              Text(
                "Overall rating",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
          ...List.generate(
              4,
              (index) => Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 110, child: Text(rates[index])),
                      buildDivider(index * 20.0 + 100)
                    ],
                  )),
                  
        ],
      ),
    );
  }
}
