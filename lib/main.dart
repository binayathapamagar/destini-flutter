import 'package:destini/story_brain.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Destini());
}

class Destini extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(
            20.0,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/destini_background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: DestiniPage(),
          ),
        ),
      ),
    );
  }
}

class DestiniPage extends StatefulWidget {
  @override
  _DestiniPageState createState() => _DestiniPageState();
}

class _DestiniPageState extends State<DestiniPage> {
  StoryBrain storyBrain = StoryBrain();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              storyBrain.getStoryTitle(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
          ),
        ),
        Expanded(
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              setState(() {
                storyBrain.getNextStory(1);
              });
            },
            child: Text(
              storyBrain.getChoice1Text(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Expanded(
          child: Visibility(
            visible: storyBrain.hideButton(),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                setState(() {
                  storyBrain.getNextStory(2);
                });
              },
              child: Text(
                storyBrain.getChoice2Text(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
