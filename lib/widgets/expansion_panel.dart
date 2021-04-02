/// Flutter code sample for ExpansionPanelList

// Here is a simple example of how to implement ExpansionPanelList.

import 'package:flutter/material.dart';
import 'package:cuts/models/expansion_panel_item.model.dart';

// stores ExpansionPanel state information

List<ExpansionPanelItem> generateItems(List<Map<String, Widget>> widgets) {
  return List.generate(widgets is List ? widgets.length : 0, (int index) {
    return ExpansionPanelItem(
        body: widgets[index]['widget'], title: widgets[index]['title']);
  });
}

/// This is the stateful widget that the main application instantiates.
class MyExpansionPanel extends StatefulWidget {
  // final List<Map<String, Widget>> listItems;
  final List<ExpansionPanelItem> listItems;
  final int elevation;
  final Color color;
  final Color bodyBackground;

  MyExpansionPanel({
    Key key,
    this.listItems,
    this.elevation = 2,
    this.color,
    this.bodyBackground = Colors.white,
  });

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyExpansionPanel.
class _MyStatefulWidgetState extends State<MyExpansionPanel> {
  // List<ExpansionPanelItem> _data = [];
  // @override
  // void initState() {
  //   super.initState();
  //   _data = generateItems(widget.listItems);
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Theme(
          data: Theme.of(context).copyWith(cardColor: widget.color),
          child: _buildPanel(),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    List<ExpansionPanelItem> _list = widget.listItems;
    return ExpansionPanelList(
      // expandedHeaderPadding: EdgeInsets.all(25),
      elevation: widget.elevation,
      expandedHeaderPadding: EdgeInsets.all(5),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _list[index].isExpanded = !isExpanded;
        });
      },
      children: _list.map((ExpansionPanelItem item) {
        return ExpansionPanel(
          // backgroundColor: Colors.red,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: item.title,
              subtitle: item.subtitle,
            );
          },
          body: Container(
            // margin: EdgeInsets.only(bottom: 10),

            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: widget.bodyBackground is Color
                  ? widget.bodyBackground
                  : Colors.grey[100],
            ),
            // color: Colors.grey[50],
            child: item.body,
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
