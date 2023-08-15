import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final bool buttonVisible;

  SectionTitle({required this.title,required this.buttonVisible});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          buttonVisible?
          OutlinedButton(
            onPressed: (){},
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Set border radius here
              ),
              side: BorderSide(color: Colors.black), // Set border color here
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                'see all',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
      ):SizedBox()
        ],
      ),
    );
  }
}
