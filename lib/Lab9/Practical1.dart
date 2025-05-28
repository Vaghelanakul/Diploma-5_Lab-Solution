import 'package:flutter/material.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback Form"),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                """   How would you describe your mood after
        using our product for the first time? """,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  child: CircleAvatar(
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.sentiment_satisfied_alt,
                          size: 40,
                          color: Colors.green,
                        )),
                  ),
                ),
                Container(
                  height: 60,
                  width: 60,
                  child: CircleAvatar(
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.sentiment_neutral_outlined,
                          size: 40,
                          color: Colors.brown,
                        )),
                  ),
                ),
                Container(
                  height: 60,
                  width: 60,
                  child: CircleAvatar(
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.sentiment_dissatisfied_outlined,
                          size: 40,
                          color: Colors.red,
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                "How would you rate this product",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "1",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )),
                ),
                Container(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "2",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )),
                ),
                Container(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "3",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )),
                ),
                Container(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "4",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )),
                ),
                Container(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "5",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Your FeedBack:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                  hintText: "Enter your feedback",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text("Your Feedback is summited successfully")));
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )))
          ],
        ),
      ),
    );
  }
}
