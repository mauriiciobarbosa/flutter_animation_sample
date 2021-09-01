import 'package:flutter/material.dart';

/*
 * The state for a scrolling container that animates items when they
 * are inserted or removed.
 *
 * When an item is inserted with insertItem an animation begins running.
 * The animation is passed to AnimatedList.itemBuilder whenever
 * the item's widget is needed.
 *
 * When an item is removed with removeItem its animation is reversed.
 * The removed item's animation is passed to the removeItem builder parameter.
 */
class AnimatedListStateWidget extends StatefulWidget {
  @override
  _AnimatedListStateWidgetState createState() =>
      _AnimatedListStateWidgetState();
}

class _AnimatedListStateWidgetState extends State<AnimatedListStateWidget> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  List<String> _data = [
    'any string 1',
    'any string 2',
    'any string 3',
    'any string 4',
    'any string 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedListState'),
      ),
      persistentFooterButtons: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ElevatedButton(
                child: Text(
                  'Add an item',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  _addAnItem();
                },
              ),
              SizedBox(width: 16),
              ElevatedButton(
                child: Text(
                  'Remove last',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  _removeLastItem();
                },
              ),
              SizedBox(width: 16),
              ElevatedButton(
                child: Text(
                  'Remove all',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  _removeAllItems();
                },
              ),
            ],
          ),
        )
      ],
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _data.length,
        itemBuilder: (context, index, animation) => _buildItem(
          context,
          _data[index],
          animation,
        ),
      ),
    );
  }

  Widget _buildItem(
      BuildContext context, String item, Animation<double> animation) {
    TextStyle textStyle = new TextStyle(fontSize: 20);

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizeTransition(
        sizeFactor: animation,
        axis: Axis.vertical,
        child: SizedBox(
          height: 50.0,
          child: Card(
            child: Center(
              child: Text(item, style: textStyle),
            ),
          ),
        ),
      ),
    );
  }

  void _addAnItem() {
    _data.insert(0, 'any string ${_data.length + 1}');
    _listKey.currentState?.insertItem(0);
  }

  void _removeLastItem() {
    String itemToRemove = _data[0];

    _listKey.currentState?.removeItem(
      0,
      (BuildContext context, Animation<double> animation) =>
          _buildItem(context, itemToRemove, animation),
      duration: const Duration(milliseconds: 250),
    );

    _data.removeAt(0);
  }

  void _removeAllItems() {
    final int itemCount = _data.length;

    for (var i = 0; i < itemCount; i++) {
      String itemToRemove = _data[0];
      _listKey.currentState?.removeItem(
        0,
        (BuildContext context, Animation<double> animation) =>
            _buildItem(context, itemToRemove, animation),
        duration: const Duration(milliseconds: 250),
      );

      _data.removeAt(0);
    }
  }
}
