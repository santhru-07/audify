import 'package:audify/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String dropdownvalue = 'profile';
 
  var items = [
    'profile',
    'settings',
    'Account',
    'Go premium',
    'Logout',
  ];
  int _selectedValue = 3;
  
  bool? value = false; 

    bool checkboxValue1 = true;
  bool checkboxValue2 = true;
  bool checkboxValue3 = true;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        onPressed: () {},
      ),
      appBar: AppBar(
        title: Text("GeeksforGeeks"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.comment),
              tooltip: 'Comment Icon'),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings),
              tooltip: 'Setting Icon'),
        ],
        backgroundColor: Colors.greenAccent[400],
        foregroundColor: Colors.white,
        elevation: 50.0,
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.menu), tooltip: 'Menu Icon'),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
             RadioListTile(
              title: Text('Male'), // Display the title for option 1
              value: 1, // Assign a value of 1 to this option
              groupValue:
                  _selectedValue, // Use _selectedValue to track the selected option
              onChanged: (value) {
                setState(() {
                  _selectedValue =
                      value!; // Update _selectedValue when option 1 is selected
                });
              },
            ),
                      RadioListTile(
              title: Text('Female'), // Display the title for option 2 // Display a subtitle for option 2
              value: 2, // Assign a value of 2 to this option
              groupValue:
                  _selectedValue, // Use _selectedValue to track the selected option
              onChanged: (value) {
                setState(() {
                  _selectedValue =
                      value!; // Update _selectedValue when option 2 is selected
                });
              },
            ),
                      RadioListTile(
              title: Text('Others'), // Display the title for option 3
              value: 3, // Assign a value of 3 to this option
              groupValue:
                  _selectedValue, // Use _selectedValue to track the selected option
              onChanged: (value) {
                setState(() {
                  _selectedValue =
                      value!; // Update _selectedValue when option 3 is selected
                });
              },
            ),
            Checkbox(     activeColor: Colors.amber,checkColor: Colors.black,
                          tristate: true, // Example with tristate
                          value: value,
                          onChanged: (bool? newValue) {
                            setState(() {
                              value = newValue;
                            });
                          },
                        ),
            CheckboxListTile(
              value: checkboxValue1,
              onChanged: (bool? value) {
                setState(() {
                  checkboxValue1 = value!;
                });
              },
              title: const Text('Headline'),
              subtitle: const Text('Supporting text'),
            ),
            const Divider(height: 0),
            CheckboxListTile(
              value: checkboxValue2,
              onChanged: (bool? value) {
                setState(() {
                  checkboxValue2 = value!;
                });
              },
              title: const Text('Headline'),
              subtitle: const Text(
                'Longer supporting text to demonstrate how the text wraps and the checkbox is centered vertically with the text.',
              ),
            ),
            const Divider(height: 0),
            CheckboxListTile(
              value: checkboxValue3,
              onChanged: (bool? value) {
                setState(() {
                  checkboxValue3 = value!;
                });
              },
              title: const Text('Headline'),
              subtitle: const Text(
                "Longer supporting text to demonstrate how the text wraps and how setting 'CheckboxListTile.isThreeLine = true' aligns the checkbox to the top vertically with the text.",
              ),
              isThreeLine: true,
            ),
            const Divider(height: 0),
        
        
           
           
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        color: Colors.blue,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('Modal BottomSheet'),
                              ElevatedButton(
                                child: const Text('Close BottomSheet'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: Text('Elevated Button'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontStyle: FontStyle.normal),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                  Navigator.pop(context);
                },
                child: Text(
                  "Text Button",
                  style: TextStyle(
                    color: Colors.green,
                  ),
                )),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.code, size: 50),
              color: Colors.green,
            ),
            DropdownButton(
              focusColor: Colors.green,
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text("profile"),
                  value: 1,
                ),
                PopupMenuItem(child: Text("Account"), value: 2),
                PopupMenuItem(child: Text("Settings"), value: 3),
                PopupMenuItem(child: Text("About GFG"), value: 4),
                PopupMenuItem(child: Text("Go premium"), value: 5),
                PopupMenuItem(child: Text("Logout"), value: 6)
              ],
            ),
            Container(
                height: 200,
                width: double.infinity,
                alignment: Alignment.center,
                margin: EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(30)),
                  border: Border.all(color: Colors.black, width: 3),
                ),
                child: Image.network(
                    "https://cdn.vectorstock.com/i/2000v/45/05/music-network-logo-vector-34044505.avif"))
          ],
        ),
      ),
    );
  }
}
