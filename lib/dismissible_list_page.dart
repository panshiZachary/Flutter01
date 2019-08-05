import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(
      title: 'dismissible',
      theme: ThemeData.dark(),
      home:Dismissile(),
    ));

class Dismissile extends StatefulWidget {
  @override
  _DismissileState createState() => _DismissileState();
}

class _DismissileState extends State<Dismissile> {
  List<String> list = List.generate(20, (index) => '浙江盘石$index元素');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dismissible'),
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Dismissible(key: Key(list[index]),
              child: ListTile(
                title: Text(list[index],
                ),
              ),
              background: Container(
                color: Colors.redAccent,
              ),
              onDismissed: (direction) {
                setState(() {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('${list[index]}被删除了')
                      ));
                  list.removeAt(index);
                });
              },

            );
          }),
    );
  }
}
