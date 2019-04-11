import 'package:flutter/material.dart';

const PrimaryColor = const Color(0xFFFFFFFF);

void main() => runApp(new MaterialApp(
      title: 'Forms in Flutter',
      theme: ThemeData(
          primaryColor: PrimaryColor,
          secondaryHeaderColor: PrimaryColor,
          selectedRowColor: PrimaryColor,
          highlightColor: PrimaryColor),
      home: new LoginPage(),
    ));

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'OK', icon: Icons.check)
];

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: choices.length);
  }

  Choice _selectedChoice = choices[0]; // The app's "state".

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final level1 = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Flexible(
              child: new TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.continueAction,
                  // Use email input type for emails.
                  decoration: new InputDecoration(
                      labelText: 'Postal Code*',
                      labelStyle: new TextStyle(color: Colors.black54),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54))))),
          new Flexible(
              child: new TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.continueAction,
                  decoration: new InputDecoration(
                      labelText: 'Hse/Blk/Tower',
                      labelStyle: new TextStyle(color: Colors.black54),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54)))))
        ],
      ),
    );
    final level2 = new Container(
      child: new Column(
        children: <Widget>[
          new TextFormField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.continueAction,
              decoration: new InputDecoration(
                  labelText: 'Street / Building Name*',
                  labelStyle: new TextStyle(color: Colors.black54),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54))))
        ],
      ),
    );

    final level3 = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Flexible(
              child: new TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.continueAction,
                  decoration: new InputDecoration(
                      labelText: 'Floor No.',
                      labelStyle: new TextStyle(color: Colors.black54),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54))))),
          new Flexible(
              child: new TextFormField(
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.send,
                  decoration: new InputDecoration(
                      labelText: 'Unit No.',
                      labelStyle: new TextStyle(color: Colors.black54),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54)))))
        ],
      ),
    );
    final level4 = new Row(children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: new Text('* Mandatory fields',
            textAlign: TextAlign.left, style: new TextStyle(color: Colors.black54)),
      )
    ]);
    return new Scaffold(
        appBar: new AppBar(
            title: new Text('Billing Address'),
            leading: Align(
                child: Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 0.0, bottom: 0.0, top: 0.0),
              child: new Text('Cancel'),
            )),
            actions: <Widget>[
              // action button new Flexible(
              Align(
                  child: Padding(
                padding: const EdgeInsets.only(
                    left: 0.0, right: 8.0, bottom: 0.0, top: 0.0),
                child: new Text('Done'),
              ))
            ],
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0.0),
                child: Theme(
                    data:
                        Theme.of(context).copyWith(accentColor: Colors.black54),
                    child: Image.asset(
                      'assets/ic_ncl_multicolored_line.png',
                    )))),
        body: new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[level1, level2, level3, level4],
          ),
        ));
  }
}
