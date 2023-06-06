import 'package:exs_9/Models/keno.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
HomePage({Key? key}) : super(key: key);

  final arr = [
    Keno(text: 'Chắn', count: 5),
    Keno(text: 'Lẻ', count: 2),
    Keno(text: 'Hòa CL', count: 3),
  ];

  @override
  Widget build(BuildContext context) {
    for (final keno in arr){
      keno.precent = (keno.count*100/5).round();
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child:Text('Home Page'),
          ),
        ),
        body: Center(
          child: SizedBox(
            width: 300,
            height: 500,
            child: Center(child: listItem()),
          ),
        ),
      ),
    );
  }

  Widget listItem() {
    return Column(
      children: [
        item(arr[0]),
        item(arr[1]),
        item(arr[2]),
      ],
    );
  }

  Widget item(Keno keno) {
    const n = 30;
    return Row(
      children: [
        SizedBox(
          width: 50,
          child:Text(keno.text),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                flex: keno.precent,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  height: 10,
                ),
              ),
              Expanded(
                flex: 100 - keno.precent,
                child: Container(
                  height: 10,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          width: 50,
          child:Text('${keno.count} lần'),
        )
      ],
    );
  }
}
