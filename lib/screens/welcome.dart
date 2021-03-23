import 'package:flutter/material.dart';
import 'package:how_much_do_you_know_h/util/constants.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("hi welcome to th oconsole");

    return Scaffold(
        appBar: AppBar(title: AppBarButton()),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/hbg.png"), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome!",
                      style: titleTextStyle,
                    ),
                    Text(
                      "It's time.",
                      style: subtitleTextStyle,
                    ),
                    SizedBox(height: 20),
                    Tooltip(
                      message: "el",
                      child: ClipRRect(
                        child: Image.network("https://i.imgur.com/l6zhZMj.jpg"),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(height: 40),
                    FractionallySizedBox(
                      widthFactor: 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CleanButton(
                              color: Theme.of(context).primaryColor,
                              borderRadius: 99,
                              onPressed: () => print("31"),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                child: Text(
                                    "PLAY",
                                    style: buttonTextStyleBold
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    FractionallySizedBox(
                      widthFactor: 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CleanButton(
                              color: Colors.grey[800],
                              borderRadius: 99,
                              onPressed: () => print("31"),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                child: Text(
                                    "ABOUT",
                                    style: buttonTextStyle
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: CleanButton(
                              color: Colors.red,
                              borderRadius: 99,
                              onPressed: () => print("31"),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                child: Text(
                                    "QUIT",
                                    style: buttonTextStyle
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              MucleonText()
            ],
          ),
        ));
  }
}

class AppBarButton extends StatefulWidget {
  @override
  _AppBarButtonState createState() => _AppBarButtonState();
}

class _AppBarButtonState extends State<AppBarButton> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(clickTitleMessages[index]),
      ),
      customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      onTap: () {
        setState(() {
          if (index + 1 == clickTitleMessages.length) {
            Navigator.pushNamed(context, "/bye");
          } else {
            index++;
          }
        });
      },
    );
  }
}

class MucleonText extends StatefulWidget {
  @override
  _MucleonTextState createState() => _MucleonTextState();
}

class _MucleonTextState extends State<MucleonText> {
  String mucleonText = "";

  void _updateMucleonEnter(PointerEvent details) {
    setState(() {
      mucleonText = "mucleon";
    });
  }

  void _updateMucleonExit(PointerEvent details) {
    setState(() {
      mucleonText = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(99)
      ),
      child: MouseRegion(
        onEnter: _updateMucleonEnter,
        onExit: _updateMucleonExit,
        child: Center(
          child: SelectableText(mucleonText),
        ),
      ),
    );
  }
}

class CleanButton extends StatelessWidget {
  final Color color;
  final double borderRadius;
  final Function onPressed;
  final Widget child;

  CleanButton({this.color, this.borderRadius = 99, this.onPressed, this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            )
        ),
      ),
      child: child
    );
  }
}

