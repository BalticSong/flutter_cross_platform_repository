import 'package:flutter/material.dart';
class DefaultPage extends StatefulWidget {
  static final route = 'defaultPage';

  const DefaultPage({Key? key}) : super(key: key);

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('default_page'),
      appBar: AppBar(title: Text('app title')),
      backgroundColor: Colors.grey,
      body: InkWell(
        key: Key('default_page_ink_well'),
        onTap: () {

        },

      ),
    );
  }
}
