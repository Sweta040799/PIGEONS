import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Poll extends StatefulWidget {
  const Poll({super.key});

  @override
  State<Poll> createState() => _PollState();
}

class _PollState extends State<Poll> {
  List<TextEditingController> controllers = [];

  var checkvalue = [];

  var field = 0;

  @override
  Widget build(BuildContext context) {
    var m = MediaQuery.of(context).size;
    return Center(
      child: Container(
        // constraints: BoxConstraints(maxHeight: 500, minHeight: 200),
        height: m.height / 2.3,
        width: m.width / 1.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 10,
                top: 15,
              ),
              child: Text(
                "Question",
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 18,
                ),
              ),
            ),
            Material(
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: TextField(
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 19,
                  ),
                  decoration: InputDecoration(
                      // ignore: prefer_const_constructors
                      hintText: "Type",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.brown),
                          borderRadius: BorderRadius.circular(20)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Text(
                    "Add Options",
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    " (tick for correct)",
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Arial',
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            if (controllers.length > 0)
              ...controllers
                  .asMap()
                  .map((index, controller) => MapEntry(
                        index,
                        Row(
                          children: [
                            Material(
                              child: Checkbox(
                                  value: checkvalue[index],
                                  onChanged: ((value) {
                                    setState(() {
                                      checkvalue[index] = !checkvalue[index];
                                    });
                                  })),
                            ),
                            Expanded(
                              child: Material(
                                  child: TextField(
                                controller: controller,
                                decoration: InputDecoration(
                                  suffixIcon: InkWell(
                                    onTap: (() {
                                      setState(() {
                                        controllers.removeAt(index);
                                        checkvalue.removeAt(index);
                                        field--;
                                      });
                                    }),
                                    child: Icon(Icons.delete),
                                  ),
                                ),
                              )),
                            ),
                          ],
                        ),
                      ))
                  .values
                  .toList(), //please modify button and text field alignment
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 30,
                  child: Row(
                    children: [
                      if (controllers.length == 0)
                        Text(
                            style: TextStyle(fontFamily: 'Arial'),
                            "Click to add options"),
                      if (field < 2)
                        FloatingActionButton(
                          child: Icon(Icons.add),
                          onPressed: () {
                            print(controllers.length);
                            setState(() {
                              field++;
                              controllers.add(TextEditingController());
                              checkvalue.add(false);
                            });
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: (field > 1)
                  ? TextButton(
                      onPressed: () => print("hi"),
                      child: Text(
                        style: TextStyle(
                            fontFamily: 'Arial',
                            color: Colors.brown,
                            backgroundColor: Colors.transparent),
                        "Send",
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
