import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/data/question_list.dart';
import 'package:quiz/screens/result.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController? _controller = PageController(initialPage: 0);
  bool isPressed = false;
  Color isTrue = Colors.green;
  Color isWrong = Colors.red;
  Color btnColor = Colors.amber;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Padding(
        padding: EdgeInsets.all(18),
        child: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: _controller!,
          onPageChanged: (page) {
            setState(() {
              isPressed = false;
            });
          },
          itemBuilder: (context, index) {
            return Column(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children:[Text("Question  ",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 23,color: Colors.grey)),
                    Text("${index + 1}/${questions.length}",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey,fontSize: 39),
                    )],
                ),

                Divider(
                  height: 5,
                  color: Colors.black,
                ),
                SizedBox(height: 26,),

                Text(questions[index].question!,style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                for (int i = 0; i < questions[index].answer!.length; i++)
                  SizedBox(width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(18.0,1,18,1),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        color: isPressed
                            ? questions[index].answer!.entries.toList()[i].value
                            ? isTrue
                            : isWrong
                            : Colors.amber,
                        onPressed: isPressed
                            ? (){}
                            : () {
                          setState(() {
                            isPressed = true;
                          });
                          if (questions[index]
                              .answer!
                              .entries
                              .toList()[i]
                              .value) {
                            score += 1;
                          }
                        },
                        child: Text(questions[index].answer!.keys.toList()[i]),
                      ),
                    ),
                  ),SizedBox(height: 26,),
            Divider(
            height: 5,
            color: Colors.black,),
                SizedBox(height: 20,),
                Row(

                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [TextButton(

                    onPressed: isPressed
                        ? index + 1 == questions.length
                        ? () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Result(score)));
                    }
                        : () {
                      _controller!.nextPage(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeIn);
                      setState(() {
                        isPressed = false;
                      });
                    }
                        : null,
                    child: Text(index + 1 == questions.length
                        ? "See Results"
                        : "Next Question",style: (TextStyle(fontSize: 15)),),
                  ),]
                )
              ],
            );
          },
          itemCount: questions.length,
        ),
      ),
    );
  }
}
