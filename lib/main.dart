import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dashboard/shared_components/card.dart';
import 'package:flutter_dashboard/shared_components/colors.dart';
import 'package:flutter_dashboard/shared_components/style.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:iconly/iconly.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:badges/badges.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: TextTheme(
            bodyLarge: MyStyles().boldBlack,
            bodyMedium: MyStyles().normalBlack,
            bodySmall: MyStyles().smallBlack,
            titleSmall: MyStyles().buttonText,
          )),
      home:    HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  int selected = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (kDebugMode) {}
          return false;
        },
        child: SafeArea(
            child: Scaffold(
                appBar: AppBar(
                    elevation: 0,
                    leading: Container(),
                    leadingWidth: 0,
                    title: Column(children: [
                      const SizedBox(
                          height: 10
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                                Icons.dashboard_rounded,
                                size: 28,
                                color: Colors.black
                            ),
                            Text(
                                "  DashBoard",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                    color: Colors.black)
                            )
                          ])
                    ]),
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.blue,
                    actions: [
                      Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: IconButton(
                              onPressed: () {
                              },
                              icon: Badge(
                                  elevation: 0,
                                  child: const Icon(IconlyLight.notification),
                                  badgeColor: Colors_().primary
                              )))
                    ]
                ),
                bottomNavigationBar: SizedBox(
                    height: 60,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 2),
                        child: DefaultTabController(
                            length: 4,
                            child: AppBar(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12))),
                                shadowColor: Colors.white,
                                elevation: 6,
                                backgroundColor: Colors.white,
                                bottom: TabBar(
                                  onTap: (index) {
                                    setState(() {
                                      selected = index;
                                    });
                                  },
                                  indicatorColor: Colors.blue,
                                  indicator: UnderlineTabIndicator(
                                    borderSide: BorderSide(
                                        color: Colors_().primary,
                                        width: 4.0,
                                        style: BorderStyle.solid),
                                    insets:
                                    const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 53.0),
                                  ),
                                  tabs: [
                                    selected == 0
                                        ? Tab(
                                        icon: Icon(
                                          IconlyBold.home,
                                          color: Colors_().primary,
                                        ))
                                        : const Tab(
                                        icon: Icon(
                                          IconlyLight.home,
                                          color: Colors.grey,
                                        )),
                                    selected == 1
                                        ? Tab(
                                        icon: Icon(
                                          IconlyBold.edit,
                                          color: Colors_().primary,
                                        ))
                                        : const Tab(
                                        icon: Icon(
                                          IconlyLight.edit,
                                          color: Colors.grey,
                                        )),
                                    selected == 2
                                        ? Tab(
                                        icon: Icon(
                                          Icons.timeline,
                                          color: Colors_().primary,
                                        ))
                                        : const Tab(
                                        icon: Icon(
                                          Icons.timeline,
                                          color: Colors.grey,
                                        )),
                                    selected == 3
                                        ? Tab(
                                        icon: Icon(
                                          IconlyBold.search,
                                          color: Colors_().primary,
                                        ))
                                        : const Tab(
                                        icon: Icon(
                                          IconlyBroken.search,
                                          color: Colors.grey,
                                        )),
                                  ],
                                )
                            )
                        )
                    )
                ),
                backgroundColor: const Color(0xfff8fcff),
                body: selected == 0
                    ? Center(
                    child: DashBoard(

                    )
                )
                    : selected == 1
                    ? Center(
                  child: Text(selected.toString()),
                )
                    : Center(
                  child: Text(selected.toString()),
                ))
        )
    );
  }
}

class DashBoard extends StatefulWidget {

  @override
  _DashBoardState createState() => _DashBoardState();
}

const Color barBackgroundColor = Color(0xff72d8bf);
const Duration animDuration = Duration(milliseconds: 250);

int touchedIndex = -1;

bool isPlaying = false;

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              height: 240,
              child: Swiper(
                indicatorLayout: PageIndicatorLayout.WARM,
                itemBuilder: (context, index) {
                  return GradientCard(
                    textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                    colorCenter: Colors.blue,
                  );
                },
                autoplay: true,
                itemCount: 3,
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                scrollDirection: Axis.horizontal,
                loop: false,
                duration: 300,
                pagination: SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.grey[300], activeColor: Colors_().primary),
                ),
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                  },
                  child: Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            IconlyBroken.search,
                            color: Colors.white,
                          ),
                          Text(
                            " Reports",
                            style: TextStyle(color: Colors.white),
                          )
                        ]),
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors_().primary,
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          IconlyBroken.activity,
                          color: Colors_().primary,
                        ),
                        Text(
                          "    Workflows",
                          style: TextStyle(color: Colors_().primary),
                        )
                      ]),
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors_().primary.withOpacity(0.17),
                      borderRadius: BorderRadius.circular(8)),
                ),
              ],
            ),
            const SizedBox(
              height: 26,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Card(
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xffACDDFB),
                            borderRadius:
                            BorderRadius.all(Radius.circular(18))),
                        child: Column(
                          children: const [
                            SizedBox(
                              height: 12,
                            ),
                            Text("Pending"),
                            Expanded(
                                child: Center(
                                    child: Text(
                                      "4",
                                      style: TextStyle(fontSize: 32),
                                    ))),
                            Text("Tasks"),
                            SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                        height: 100,
                        width: size.width * 0.3 - 24,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      color: const Color(0xffffffff),
                    ),
                    Card(
                      child: Container(
                        child: Column(
                          children:  [
                            const SizedBox(
                              height: 12,
                            ),
                            const Text("Completed",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
                            Expanded(
                                child: CircularPercentIndicator(
                                  radius: 30.0,
                                  lineWidth: 5.0,
                                  percent: 0.63,
                                  backgroundColor: Colors.white60,
                                  center: const Text("63 %",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
                                  progressColor: Colors.white,
                                )),
                            const Text("Workflows",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
                            const  SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                        decoration: const BoxDecoration(
                            color: Color(0xffFD3B1D),
                            borderRadius:
                             BorderRadius.all(Radius.circular(18))),
                        height: 140,
                        width: 100,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      color: const Color(0xffffffff),
                    ),
                  ],
                ),
                SizedBox(
                  width: size.width * 0.7 - 17,
                  height: 260,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      color: const Color(0xffffffff),
                      child: Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                const Text(
                                  'Activity',
                                  style: TextStyle(
                                      color: Color(0xff0f4a3c),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                const Text(
                                  'Per Work Days',
                                  style: TextStyle(
                                      color: Color(0xff379982),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 38,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: BarChart(
                                      mainBarData(),
                                      swapAnimationDuration: animDuration,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                icon: !isPlaying
                                    ? const Icon(
                                  Icons.refresh,
                                  color: Color(0xff0f4a3c),
                                )
                                    : JumpingDotsProgressIndicator(
                                  fontSize: 22,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isPlaying = !isPlaying;
                                    if (isPlaying) {}
                                  });
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
      int x,
      double y, {
        bool isTouched = false,
        Color barColor = Colors.blue,
        double width = 12,
        List<int> showTooltips = const [],
      }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          colors: isTouched ? [Colors.yellow] : [barColor],
          width: width,
          borderSide: isTouched
              ? const BorderSide(color: Colors.yellow, width: 1)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            colors: [barBackgroundColor],
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(5, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, 5, isTouched: i == touchedIndex);
      case 1:
        return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
      case 2:
        return makeGroupData(2, 5, isTouched: i == touchedIndex);
      case 3:
        return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
      case 4:
        return makeGroupData(4, 9, isTouched: i == touchedIndex);
      default:
        return throw Error();
    }
  });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blue,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = 'Monday';
                  break;
                case 1:
                  weekDay = 'Tuesday';
                  break;
                case 2:
                  weekDay = 'Wednesday';
                  break;
                case 3:
                  weekDay = 'Thursday';
                  break;
                case 4:
                  weekDay = 'Friday';
                  break;

                default:
                  throw Error();
              }
              return BarTooltipItem(
                weekDay + '\n',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: (rod.toY - 1).toString(),
                    style: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            }),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 16,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'M';
              case 1:
                return 'T';
              case 2:
                return 'W';
              case 3:
                return 'T';
              case 4:
                return 'F';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
    );
  }

}


