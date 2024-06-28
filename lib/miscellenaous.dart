// import 'package:flutter/material.dart';

// class Miscellaneous extends StatefulWidget {
//   const Miscellaneous({super.key});

//   @override
//   State<Miscellaneous> createState() => _MiscellaneousState();
// }

// class _MiscellaneousState extends State<Miscellaneous> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         iconTheme: IconThemeData(color: Colors.white),
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               Icons.arrow_back_ios_new_outlined,
//               color: Colors.white,
//             )),
//         title: Text(
//           'Miscellaneous',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class MiscellaneousPage extends StatefulWidget {
  const MiscellaneousPage({Key? key}) : super(key: key);

  @override
  _MiscellaneousPageState createState() => _MiscellaneousPageState();
}

class _MiscellaneousPageState extends State<MiscellaneousPage> {
  List<Item> _data = generateItems();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xff252525),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Miscellaneous',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: ExpansionPanelList(
            elevation: 0,
            expandedHeaderPadding: EdgeInsets.zero,
            dividerColor: Colors.transparent,
            animationDuration: Duration(milliseconds: 500),
            children: _data.map<ExpansionPanel>((Item item) {
              return ExpansionPanel(
                canTapOnHeader: true,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(
                      item.headerValue,
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: IconButton(
                      icon: isExpanded
                          ? Icon(Icons.arrow_drop_down)
                          : Icon(Icons.arrow_drop_up),
                      onPressed: () {
                        setState(() {
                          item.isExpanded = !item.isExpanded;
                        });
                      },
                    ),
                  );
                },
                body: Container(
                  padding: EdgeInsets.all(10.0),
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
            Text('Experience 1',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text('Role: Teaching Professional',
                style: TextStyle(color: Colors.white)),
            Text('Organization: Kartavya',
                style: TextStyle(color: Colors.white)),
            Text('Date: September 2020 - November 2020',
                style: TextStyle(color: Colors.white)),
            Text(
                'Description: Taught basic mathematics and science to a batch of underprivileged children at Kartavya Centre-2.',
                style: TextStyle(color: Colors.white70)),
          ],
        ),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/Muskurahat.png",
              height: 100,
            ),
            Text('Experience 2',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text('Role: Fundraising Intern',
                style: TextStyle(color: Colors.white)),
            Text('Organization: Muskurahat Foundation',
                style: TextStyle(color: Colors.white)),
            Text('Date: May 2021 - June 2021',
                style: TextStyle(color: Colors.white)),
            Text('Description: Raised fund for underprivileged children.',
                style: TextStyle(color: Colors.white70)),
          ],
        ),
      ],
    ),
    // Add more fields as necessary
  ];
}
