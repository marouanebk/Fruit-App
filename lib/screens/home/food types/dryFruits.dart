import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DryFruitsScreen extends StatefulWidget {
  const DryFruitsScreen({Key? key}) : super(key: key);

  @override
  State<DryFruitsScreen> createState() => _DryFruitsScreenState();
}

class _DryFruitsScreenState extends State<DryFruitsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('hello Dry Fruits'),
    );
    
  }
}