import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:loan/txt.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Loan App",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  double result = 0;
  double interestRate = 4.9;
  double costOfLoan = 12622.07;
  double loanAmount = 3000;
  double months = 12;
  double creditScore = 579;
  String r;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    Color blue = Color.fromRGBO(77, 77, 255, 0.8);
    Color sky = Color.fromRGBO(77, 166, 255, 1);
    return Scaffold(
      body: Container(
        width: w,
        height: h,
        child: Column(
          children: [
            Container(
              width: w,
              height: h * 0.9,
              child: SingleChildScrollView(
                child: Expanded(
                  flex: 90,
                  child: Column(
                    children: [
                      Container(
                        width: w,
                        height: h * 0.35,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [blue, sky]),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 50.0, bottom: 10),
                              child: Txt("Loan Calculator", 18, FontWeight.w400,
                                  Colors.white),
                            ),
                            Container(
                              width: w * 0.8,
                              height: h * 0.2,
                              child: Card(
                                color: Color.fromRGBO(0, 0, 0, 0.8),
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Txt("\$ $result", 30, FontWeight.bold,
                                          Colors.white),
                                      Txt(
                                          "Est. Monthly Payment",
                                          12,
                                          FontWeight.bold,
                                          Colors.grey.shade500),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Txt(
                                              "Est. Interest Rate",
                                              10,
                                              FontWeight.normal,
                                              Colors.grey.shade500),
                                          Txt(
                                              "$interestRate%",
                                              10,
                                              FontWeight.normal,
                                              Colors.grey.shade500),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15.0, bottom: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Txt(
                                                "Total Est. Cost of Loan",
                                                10,
                                                FontWeight.normal,
                                                Colors.grey.shade500),
                                            Txt(
                                                "\$$costOfLoan",
                                                10,
                                                FontWeight.normal,
                                                Colors.grey.shade500),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        color: Color.fromRGBO(0, 0, 0, 0.8),
                        width: w,
                        height: h * 0.65,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Txt("Loan Amount", 13, FontWeight.bold,
                                      Colors.white),
                                  Txt("\$${loanAmount.round()}", 15,
                                      FontWeight.bold, Colors.white),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 10),
                              child: FlutterSlider(
                                values: [loanAmount],
                                min: 3000,
                                max: 20000,
                                onDragging:
                                    (handlerIndex, lowerValue, upperValue) {
                                  setState(() {
                                    loanAmount = lowerValue;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Txt("-  \$3000", 10, FontWeight.normal,
                                      Colors.grey),
                                  Txt("\$20000", 10, FontWeight.normal,
                                      Colors.grey),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Txt("Interested in a different amount?", 11,
                                FontWeight.normal, Colors.grey),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 20.0, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Txt("Loan Term", 13, FontWeight.bold,
                                          Colors.white),
                                      Txt("  (Months)", 10, FontWeight.normal,
                                          Colors.grey),
                                    ],
                                  ),
                                  Txt("${months.round()}", 15, FontWeight.bold,
                                      Colors.white),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, right: 15),
                              child: FlutterSlider(
                                values: [months],
                                min: 12,
                                max: 60,
                                step: FlutterSliderStep(step: 12),
                                onDragging:
                                    (handlerIndex, lowerValue, upperValue) {
                                  setState(() {
                                    months = lowerValue;
                                  });
                                },
                              ),
                            ),
                            Container(
                              width: w,
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Txt("-", 10, FontWeight.normal,
                                        Colors.grey),
                                  ),
                                  Txt("12", 10, FontWeight.normal, Colors.grey),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 50),
                                      child: Txt("24", 10, FontWeight.normal,
                                          Colors.grey)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 65.0),
                                    child: Txt("36", 10, FontWeight.normal,
                                        Colors.grey),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 60.0),
                                    child: Txt("48", 10, FontWeight.normal,
                                        Colors.grey),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 55.0),
                                    child: Txt("60", 10, FontWeight.normal,
                                        Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30, left: 20.0, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Txt("Fico Credit Score", 13,
                                          FontWeight.bold, Colors.white),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Icon(
                                        Icons.info_outline,
                                        color: Colors.grey,
                                        size: 14,
                                      ),
                                    ],
                                  ),
                                  Txt("${creditScore.round()}", 15,
                                      FontWeight.bold, Colors.white),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 10),
                              child: FlutterSlider(
                                values: [creditScore],
                                min: 579,
                                max: 800,
                                step: FlutterSliderStep(step: 1),
                                onDragging:
                                    (handlerIndex, lowerValue, upperValue) {
                                  setState(() {
                                    creditScore = lowerValue;
                                  });
                                },
                              ),
                            ),
                            Container(
                              width: w,
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Txt("-", 10, FontWeight.normal,
                                        Colors.grey),
                                  ),
                                  Txt("<579", 10, FontWeight.normal,
                                      Colors.grey),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 40),
                                    child: Txt("580", 10, FontWeight.normal,
                                        Colors.grey),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 60.0),
                                    child: Txt("670", 10, FontWeight.normal,
                                        Colors.grey),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50.0),
                                    child: Txt("740", 10, FontWeight.normal,
                                        Colors.grey),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50.0),
                                    child: Txt("800+", 10, FontWeight.normal,
                                        Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: w,
              color: Color.fromRGBO(0, 0, 0, 0.8),
              height: h * 0.1,
              child: Expanded(
                flex: 10,
                child: Column(
                  children: [
                    RaisedButton(
                        child: Text("Start Your Application"),
                        textColor: blue,
                        splashColor: sky,
                        padding: EdgeInsets.only(
                            left: 60, right: 60, top: 15, bottom: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {
                          setState(() {
                            r = calculateLoan(loanAmount, months)
                                .toStringAsFixed(2);
                            result = double.parse(r);
                          });
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double calculateLoan(a, n) {
    return (a * ((interestRate / 100) / n));
  }
}
