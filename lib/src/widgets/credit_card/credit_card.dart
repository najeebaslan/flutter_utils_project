/*File : FuCreditCard
Version : 1.0.0
*/

/// [FuCreditCard] - customisable credit card with all the necessary details in it.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_utils_project/src/themes/app_theme.dart';
import 'package:flutter_utils_project/src/utils/formatters/card_month_input_formatter.dart';
import 'package:flutter_utils_project/src/utils/formatters/card_number_input_formatter.dart';
import 'package:flutter_utils_project/src/utils/spacing.dart';
import 'package:flutter_utils_project/src/widgets/text/text.dart';
import 'package:flutter_utils_project/src/widgets/text_field/text_field.dart';

typedef OnCreditCardNumberChanged = void Function(String creditCardNumber);
typedef OnCreditCardDateChanged = void Function(String creditCardDate);
typedef OnCreditCardNameChanged = void Function(String creditCardName);
typedef OnCreditCardCVVChanged = void Function(String creditCardCVV);

class FuCreditCard extends StatefulWidget {
  final OnCreditCardNumberChanged onCreditCardNumberChanged;
  final OnCreditCardDateChanged onCreditCardDateChanged;
  final OnCreditCardNameChanged onCreditCardNameChanged;
  final OnCreditCardCVVChanged onCreditCardCVVChanged;

  const FuCreditCard(
      {Key? key,
      required this.onCreditCardNumberChanged,
      required this.onCreditCardDateChanged,
      required this.onCreditCardNameChanged,
      required this.onCreditCardCVVChanged})
      : super(key: key);

  @override
  _FuCreditCardState createState() => _FuCreditCardState();
}

class _FuCreditCardState extends State<FuCreditCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isFront = true;

  //Credit card
  String creditCardNumber = "4040 4040 4040 4040";
  String creditCardDate = "MM/YY";
  String creditCardName = "Holder Name";
  String creditCardCVV = "739";
  Color creditCardColor = const Color(0xff334382);
  TextEditingController? cardNumberTextEditingController,
      cardDateTextEditingController,
      cardNameTextEditingController,
      cardCVVTextEditingController;

  //Focus node
  FocusNode? creditNumberFocusNode,
      creditDateFocusNode,
      creditNameFocusNode,
      creditCVVFocusNode;

  flip({bool goFront = false, bool goBack = false}) async {
    if (goFront && isFront) {
      return;
    }
    if (goBack && !isFront) {
      return;
    }
    await _controller.reverse();
    setState(() {
      isFront = !isFront;
    });
    await _controller.forward();
  }

  @override
  initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400), value: 1);

    cardNumberTextEditingController = TextEditingController();
    cardDateTextEditingController = TextEditingController();
    cardNameTextEditingController = TextEditingController();
    cardCVVTextEditingController = TextEditingController();

    creditNumberFocusNode = FocusNode();
    creditDateFocusNode = FocusNode();
    creditNameFocusNode = FocusNode();
    creditCVVFocusNode = FocusNode();

    cardNumberTextEditingController!.addListener(() {
      setState(() {
        if (cardNumberTextEditingController!.text.isNotEmpty) {
          creditCardNumber = cardNumberTextEditingController!.text;
          widget.onCreditCardNumberChanged(creditCardNumber);
        } else {
          creditCardNumber = "4040 4040 4040 4040";
        }
      });
    });

    cardDateTextEditingController!.addListener(() {
      setState(() {
        if (cardDateTextEditingController!.text.isNotEmpty) {
          creditCardDate = cardDateTextEditingController!.text;
          widget.onCreditCardDateChanged(creditCardDate);
        } else {
          creditCardDate = "MM/YY";
        }
      });
    });

    cardNameTextEditingController!.addListener(() {
      setState(() {
        if (cardNameTextEditingController!.text.isNotEmpty) {
          creditCardName = cardNameTextEditingController!.text;
          widget.onCreditCardNameChanged(creditCardName);
        } else {
          creditCardName = "Holder Name";
        }
      });
    });

    cardCVVTextEditingController!.addListener(() {
      setState(() {
        if (cardCVVTextEditingController!.text.isNotEmpty) {
          creditCardCVV = cardCVVTextEditingController!.text;
          widget.onCreditCardCVVChanged(creditCardCVV);
        } else {
          creditCardCVV = "739";
        }
      });
    });

    creditNumberFocusNode!.addListener(() {
      flip(goFront: true);
    });
    creditDateFocusNode!.addListener(() {
      flip(goFront: true);
    });
    creditNameFocusNode!.addListener(() {
      flip(goFront: true);
    });

    creditCVVFocusNode!.addListener(() {
      flip(goBack: true);
    });
  }

  @override
  dispose() {
    super.dispose();
    cardNumberTextEditingController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onPanUpdate: (details) {
            if (details.delta.dx < -6) {
              flip(goBack: true);
            } else if (details.delta.dx > 6) {
              flip(goFront: true);
            }
          },
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform(
                transform: Matrix4.rotationY((1 - _controller.value) * pi / 2),
                alignment: Alignment.center,
                child: SizedBox(
                  height: 210,
                  child: isFront
                      ? Container(
                          height: 210,
                          margin: FuSpacing.xy(8, 24),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.7,
                                color: FuAppTheme.theme.colorScheme.surface),
                            color: creditCardColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                          ),
                          padding: FuSpacing.all(24),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    padding: FuSpacing.xy(8, 4),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4))),
                                    child: FuText.sh1("VISA",
                                        fontWeight: 700,
                                        color: creditCardColor),
                                  ),
                                ),
                                FuTextField(
                                  contentPadding: FuSpacing.all(0),
                                  scrollPadding: const EdgeInsets.all(0),
                                  cursorColor: Colors.white,
                                  enabledBorderColor: Colors.transparent,
                                  labelText: creditCardNumber,
                                  labelTextColor: Colors.white,
                                  isDense: true,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  focusedBorderColor: Colors.transparent,
                                  autoIcon: false,
                                  autoFocusedBorder: false,
                                  controller: cardNumberTextEditingController,
                                  keyboardType: TextInputType.number,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  focusNode: creditNumberFocusNode,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(19),
                                    FuCardNumberInputFormatter()
                                  ],
                                ),
                                FuSpacing.height(6),
                                FuTextField(
                                  contentPadding: FuSpacing.all(0),
                                  scrollPadding: const EdgeInsets.all(0),
                                  cursorColor: Colors.white,
                                  enabledBorderColor: Colors.transparent,
                                  labelText: creditCardDate,
                                  labelTextColor: Colors.white,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  focusedBorderColor: Colors.transparent,
                                  autoIcon: false,
                                  isDense: true,
                                  autoFocusedBorder: false,
                                  controller: cardDateTextEditingController,
                                  keyboardType: TextInputType.number,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  focusNode: creditDateFocusNode,
                                  inputFormatters: [
                                    FuCardMonthInputFormatter(),
                                    LengthLimitingTextInputFormatter(5),
                                  ],
                                ),
                                FuSpacing.height(6),
                                FuTextField(
                                  contentPadding: FuSpacing.all(0),
                                  scrollPadding: const EdgeInsets.all(0),
                                  cursorColor: Colors.white,
                                  enabledBorderColor: Colors.transparent,
                                  labelText: creditCardName,
                                  labelTextColor: Colors.white,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  focusedBorderColor: Colors.transparent,
                                  autoIcon: false,
                                  isDense: true,
                                  autoFocusedBorder: false,
                                  controller: cardNameTextEditingController,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  focusNode: creditNameFocusNode,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(24),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(
                          height: 210,
                          margin: FuSpacing.xy(8, 24),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.7,
                                color: FuAppTheme.theme.colorScheme.surface),
                            color: creditCardColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            boxShadow: [
                              BoxShadow(
                                color: FuAppTheme.theme.cardTheme.shadowColor!
                                    .withAlpha(28),
                                blurRadius: 3,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Container(
                            padding: FuSpacing.y(24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  height: 36,
                                  color: Colors.black,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        height: 36,
                                        color: const Color(0xffbdc2d8),
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      height: 28,
                                      color: Colors.white,
                                      padding: FuSpacing.left(8),
                                      alignment: Alignment.centerLeft,
                                      child: FuTextField(
                                        contentPadding: FuSpacing.all(0),
                                        scrollPadding: const EdgeInsets.all(0),
                                        keyboardType: TextInputType.number,
                                        enabledBorderColor: Colors.transparent,
                                        labelText: creditCardCVV,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.never,
                                        focusedBorderColor: Colors.transparent,
                                        autoIcon: false,
                                        autoFocusedBorder: false,
                                        controller:
                                            cardCVVTextEditingController,
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        focusNode: creditCVVFocusNode,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(3),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: FuSpacing.right(24),
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    padding: FuSpacing.xy(8, 4),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4))),
                                    child: FuText.b1("VISA",
                                        fontWeight: 700,
                                        color: creditCardColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
