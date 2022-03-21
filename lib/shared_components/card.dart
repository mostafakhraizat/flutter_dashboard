import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'colors.dart';

class GradientCard extends StatefulWidget {
  const GradientCard(
      {Key? key,
      this.colorBegin,
      this.colorCenter,
      this.colorEnd,
      this.title,
      this.subtitle,
      this.topIcon,
      this.bottomIcon,
      this.textStyle})
      : super(key: key);
  final Color? colorBegin;
  final Color? colorCenter;
  final Color? colorEnd;
  final Text? title;
  final Text? subtitle;
  final Widget? topIcon;
  final Widget? bottomIcon;
  final TextStyle? textStyle;

  @override
  _GradientCardState createState() => _GradientCardState();
}

class _GradientCardState extends State<GradientCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Center(
            child: Stack(alignment: Alignment.center, children: <Widget>[
          Positioned(
              top: 0,
              bottom: 10,
              child: Card(
                  elevation: 0,
                  color: const Color(0xffcde0ff),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(34)),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width - 110,
                      height: 300))),
          Positioned(
              top: 0,
              bottom: 18,
              child: Card(
                  elevation: 0,
                  color: const Color(0xff90bafe),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(34)),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 80,
                    height: 300,
                  ))),
          Positioned(
            top: 0,
            bottom: 30,
            child: Container(
              width: MediaQuery.of(context).size.width - 50,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: const Alignment(-1, -1),
                      end: const Alignment(0, -2),
                      colors: [
                        Colors_().primary,
                        Colors_().primary.withOpacity(0.5),
                        Colors_().primary,
                      ]),
                  borderRadius: const BorderRadius.all(Radius.circular(34))),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: widget.title == null
                                    ? Text(
                                        "Income",
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.7)),
                                      )
                                    : widget.title!),
                            const Icon(
                              IconlyBold.send,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 24,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: widget.title == null
                                    ? Text(
                                        "This Month",
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.9),
                                            fontSize: 16),
                                      )
                                    : widget.subtitle!),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 24,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Visit",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: const Color(0xffffffff)
                                      .withOpacity(0.8)
                                      .withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(20)),
                            )
                          ]
                        )
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              IconlyBold.arrow_up_2,
                              color: Colors.white,
                            ),
                            Text(
                              " +1.4%",
                              style: TextStyle(color: Colors.white),
                            )
                          ]
                        ),
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                            color: const Color(0xffcde0ff).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      const SizedBox(
                        width: 24,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          )
        ])));
  }
}
