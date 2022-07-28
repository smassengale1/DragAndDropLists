import 'package:drag_and_drop_lists/drag_and_drop_item.dart';
import 'package:drag_and_drop_lists/drag_and_drop_list_interface.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:example/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';





class Group {
  String name;
  List<String> children;

  Group(this.name, this.children);
}



class DragIntoListExample extends StatefulWidget {
  DragIntoListExample({Key? key}) : super(key: key);

  @override
  _DragIntoListExample createState() => _DragIntoListExample();
}

class _DragIntoListExample extends State<DragIntoListExample> {
  List<DragAndDropList> _contents = <DragAndDropList>[];
  List<Group> groups = [];

  @override
  void initState() {
    super.initState();

    Group a = Group("A", ["Animal", "Alpha", "Ape", "Angry"]);
    Group b = Group("B", ["Bat", "Beautiful", "Bee"]);
    Group c = Group("C", ["Cat", "Cocoon", "Caterpillar"]);

    groups.addAll([a, b, c]);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const Text("Reorder Workout"),
      ),
      body: DragAndDropLists(
        children: _generateDraggableGroups(),
        onListReorder: (int old, int _new) {
          setState(() {
            Group g = groups.removeAt(old);
            groups.insert(_new, g);
          });
        },
        onItemReorder: (int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
          setState(() {
           String child = groups[oldListIndex].children.removeAt(oldItemIndex);
           groups[newListIndex].children.insert(newItemIndex, child);
          });
        },
        // fires when a group starts dragging and stops
        // listGhost is mandatory when using expansion tiles to prevent multiple widgets using the same globalkey
        listGhost: const Padding(
          padding:  EdgeInsets.symmetric(vertical: 30.0),
        ),
        itemDivider: const SizedBox(height: 5),
        itemDecorationWhileDragging: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).cardColor.withOpacity(0.7),
              spreadRadius: 2,

              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        listInnerDecoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }

  _generateDraggableGroups() {
    const TextStyle headerStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0);

    return List.generate(groups.length, (index) {
      Group group = groups[index];
      return DragAndDropListExpansion(
          listKey: ObjectKey(group.name),
          disableTopAndBottomBorders: true,
          headerElevation: 8,
          headerHorizontalGap: 0,
          initiallyExpanded: true,
          iconColor: Theme.of(context).colorScheme.tertiary,
          trailing: DragHandle(
            verticalAlignment: DragHandleVerticalAlignment.top,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.drag_handle,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ),

          children: _generateDraggableExercises(group, index),
          contentsWhenEmpty: const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Opacity(
                    opacity: .6,
                    child: Text("No Exercises", style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: "Helvetica Neue",
                        letterSpacing: .4
                    ))
                ),
              )
          ),
          title: Text(group.name, style: headerStyle)
      );
    });
  }

  List<DragAndDropItem> _generateDraggableExercises(Group group, int groupIndex) {
    List<DragAndDropItem> items = [];

    for (String s in group.children) {
      items.add(
          DragAndDropItem(
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Card(
                child: ListTile(
                  title: Text(s),
                ),
              ),
            )
          )
      );
    }

    return items;
  }

}
