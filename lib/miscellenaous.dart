import 'package:flutter/material.dart';

class MiscellaneousPage extends StatefulWidget {
  const MiscellaneousPage({super.key});

  @override
  MiscellaneousPageState createState() => MiscellaneousPageState();
}

class MiscellaneousPageState extends State<MiscellaneousPage> {
  final List<Item> _data = generateItems();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xff252525),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Miscellaneous',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: ExpansionPanelList(
            elevation: 0,
            expandedHeaderPadding: EdgeInsets.zero,
            dividerColor: Colors.transparent,
            animationDuration: const Duration(milliseconds: 500),
            children: _data.map<ExpansionPanel>((Item item) {
              return ExpansionPanel(
                canTapOnHeader: true,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(
                      item.headerValue,
                      style: const TextStyle(color: Colors.black),
                    ),
                    trailing: IconButton(
                      icon: isExpanded
                          ? const Icon(Icons.arrow_drop_down)
                          : const Icon(Icons.arrow_drop_up),
                      onPressed: () {
                        setState(() {
                          item.isExpanded = !item.isExpanded;
                        });
                      },
                    ),
                  );
                },
                body: Container(
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.grey[850],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: item.expandedValue.map<Widget>((Widget widget) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: widget,
                      );
                    }).toList(),
                  ),
                ),
                isExpanded: item.isExpanded,
              );
            }).toList(),
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _data[index].isExpanded = !isExpanded;
              });
            },
          ),
        ),
      ),
    );
  }
}

class Item {
  Item({
    required this.headerValue,
    required this.expandedValue,
    this.isExpanded = false,
  });

  String headerValue;
  List<Widget> expandedValue;
  bool isExpanded;
}

List<Item> generateItems() {
  return [
    Item(
      headerValue: 'Volunteering',
      expandedValue: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/kartavya.png",
              height: 100,
            ),
            const Text('Experience 1',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            const Text('Role: Teaching Professional',
                style: TextStyle(color: Colors.white)),
            const Text('Organization: Kartavya',
                style: TextStyle(color: Colors.white)),
            const Text('Date: September 2020 - November 2020',
                style: TextStyle(color: Colors.white)),
            const Text(
                'Description: Taught basic mathematics and science to a batch of underprivileged children at Kartavya Centre-2.',
                style: TextStyle(color: Colors.white70)),
          ],
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/Muskurahat.png",
              height: 100,
            ),
            const Text('Experience 2',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            const Text('Role: Fundraising Intern',
                style: TextStyle(color: Colors.white)),
            const Text('Organization: Muskurahat Foundation',
                style: TextStyle(color: Colors.white)),
            const Text('Date: May 2021 - June 2021',
                style: TextStyle(color: Colors.white)),
            const Text('Description: Raised fund for underprivileged children.',
                style: TextStyle(color: Colors.white70)),
          ],
        ),
      ],
    ),
  ];
}
