import 'package:animate_app/core/app_content.dart';
import 'package:animate_app/core/apputils.dart';
import 'package:animate_app/core/image_utils.dart';
import 'package:animate_app/presentation/widgets/fixed_footer.dart';
import 'package:animate_app/presentation/widgets/wrap_image_bg.dart';
import 'package:flutter/material.dart';

class MyAppAnimate extends StatefulWidget {
  const MyAppAnimate({Key? key}) : super(key: key);

  @override
  State<MyAppAnimate> createState() => _MyAppState();
}

class _MyAppState extends State<MyAppAnimate>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late bool _imagesAndTextLoaded = false;
  late bool _imagesAndTextLoadedComplete = false;
  late bool _loadWidget=false;

  final int startCount = 10;
  final int endCount = 10900;
  final Duration duration =
      Duration(seconds: 2); 
   

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: duration,
      vsync: this,
    );
      
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
       

    _controller.forward();
    _loadImagesAndText();
    _loadImagesAndTextComplete();
    _loadWidgets();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        excludeHeaderSemantics: false,
        backgroundColor: Colors.amber[50],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Container(
                      width: 100 + (_controller.value * 150),
                      color: Colors.white,
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Icon(
                              Icons.location_on, 
                              color: Colors.black12,
                            ),
                          ),
                          SizedBox(
                            width: 50 + (_controller.value * 120),
                            child: const Padding(
                              padding: EdgeInsets.only(right: 5.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText:
                                      'Saint Petersbug', // Placeholder text
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return CircleAvatar(
                    radius: 8 + (_animation.value * 15),
                    backgroundImage: const AssetImage(logo),
                  );
                },
              ),
            ),
          ],
        ),
        actions: const [],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
         decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 255, 255, 1),
                      Color.fromARGB(255, 240, 185, 84),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
        child: SingleChildScrollView(
          child: Stack(
        
            children: [
              Container(
               
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      FutureBuilder(
                        future: _loadImagesAndText(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const SizedBox();
                          } else {
                            if (_imagesAndTextLoaded) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: TweenAnimationBuilder(
                                  tween: Tween<double>(begin: 10, end: 20),
                                  duration: const Duration(seconds: 1),
                                  builder: (BuildContext context, double value,
                                      Widget? child) {
                                    return Text(
                                      "Hi, $userName",
                                      style: TextStyle(
                                        fontSize: value,
                                        color:
                                            const Color.fromARGB(196, 40, 19, 19),
                                      ),
                                    );
                                  },
                                ),
                              );
                            } else {
                              return const SizedBox();
                            }
                          }
                        },
                      ),
                      const SizedBox(height: 5),
                      FutureBuilder(
                        future: _loadImagesAndText(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const SizedBox();
                          } else if (snapshot.hasError) {
                            return const SizedBox();
                          } else {
                            if (_imagesAndTextLoaded) {
                              return TweenAnimationBuilder(
                                tween: Tween<double>(begin: 0.0, end: 1.0),
                                duration: const Duration(seconds: 1),
                                builder: (BuildContext context, double value,
                                    Widget? child) {
                                  return Opacity(
                                    opacity: value,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: const Padding(
                                        padding: EdgeInsets.only(right: 90.0),
                                        child: Text(
                                          appHeading,
                                          style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.w400,
                                            height: 1,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              return const SizedBox();
                            }
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      FutureBuilder(
                        future: _loadImagesAndTextComplete(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const SizedBox();
                          } else if (snapshot.hasError) {
                            return const SizedBox();
                          } else {
                            if (_imagesAndTextLoadedComplete) {
                              return TweenAnimationBuilder(
                                duration: const Duration(seconds: 1),
                                tween: Tween<double>(begin: 100, end: 180),
                                builder: (BuildContext context, double value,
                                    Widget? child) {
                                  int count = value.toInt() * 25;
                                  int countSecondValue = value.toInt() * 35;
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: value,
                                        height: value,
                                        decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              appDuration,
                                              style:
                                                  TextStyle(color: Colors.white),
                                            ),
                                            AppUtils.Gap(20),
                                            Text(
                                              "$count",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: value / 6,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            AppUtils.Gap(5),
                                            const Text("offers",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ),
                                      AppUtils.GapW(10),
                                      Container(
                                        width: value,
                                        height: value,
                                        decoration: BoxDecoration(
                                          color: Colors.amber[50],
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text("$buy",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                            AppUtils.Gap(20),
                                            Text(
                                              "$countSecondValue",
                                              style:  TextStyle(
                                                color: const Color.fromARGB(
                                                    252, 135, 91, 29),
                                                fontSize:
                                                    value / 6, 
        
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            AppUtils.Gap(5),
                                         const   Text("offers",
                                                style:   TextStyle(
                                                    color: Color.fromARGB(
                                                        252, 135, 91, 29))),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              return const SizedBox();
                            }
                          }
                        },
                      ),
                      AppUtils.Gap(20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: 
                         FutureBuilder(
                        future: _loadWidgets(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const SizedBox();
                          } else if (snapshot.hasError) {
                            return const SizedBox();
                          } else {
                            if (_loadWidget) {
                              return TweenAnimationBuilder(
                                tween: Tween<double>(begin: 10.0, end: 40.0),
                                duration: const Duration(seconds: 4),
                                builder: (BuildContext context, double value,
                                    Widget? child) {
                    return  Wrap(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.center,
                          spacing: 0,
                          runSpacing: 0,
                          children: [
                            WrapImageBackgroud(
                              width: MediaQuery.of(context).size.width,
                              image: parlor1,
                              index: 1,
                              animate:value
                            ),
                            WrapImageBackgroud(
                              width: MediaQuery.of(context).size.width / 2.4,
                              image: parlor2,
                              index: 2,
                                animate:value
        
                            ),
                            WrapImageBackgroud(
                              width: MediaQuery.of(context).size.width / 2.4,
                              image: parlor3,
                              index: 3,
                               animate:value
        
                            ),
                          ],
                        );
                                    }
                              );
                         }
                         else{
                          return SizedBox();
                         }}
                        }
                         ),
                      ),
                    ],
                  ),
                ),
              ),
                FutureBuilder(
                        future: _loadWidgets(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const SizedBox();
                          } else if (snapshot.hasError) {
                            return const SizedBox();
                          } else {
                            
                          return const  FixedFooterScreen();
                          }
                        }
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _loadImagesAndText() async {
    setState(() {
      _imagesAndTextLoaded = true;
    });
    await Future.delayed(const Duration(seconds: 3));
  }

  Future<void> _loadImagesAndTextComplete() async {
    setState(() {
      _imagesAndTextLoadedComplete = true;
    });
    await Future.delayed(const Duration(seconds: 5));
  }

  Future<void> _loadWidgets() async {
        setState(() {
      _loadWidget = true;
    });
    await Future.delayed(const Duration(seconds: 5));
  }
}
