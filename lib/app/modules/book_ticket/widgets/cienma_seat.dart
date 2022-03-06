import 'package:flutter/material.dart';

const Color VIP_COLOR = Color(0xff564CA3);
const Color Selected = Color(0xffCD9D0F);
const Color NOT_AVILABLE = Color(0xffA6A6A6);
const Color REGULAR = Color(0xff61C3F2);

class CienmaSeat extends StatefulWidget {
  bool isReserved;

  bool isSelected;
  final double marginHorizontal;
  final double marinVertical;
  final double containerWidth;
  final double containerHeight;
  final double iconSize;

  CienmaSeat(
      {Key? key,
      this.isSelected = false,
      this.isReserved = false,
      required this.marginHorizontal,
      required this.marinVertical,
      required this.containerWidth,
      required this.containerHeight,
      required this.iconSize})
      : super(key: key);

  @override
  _CienmaSeatState createState() => _CienmaSeatState();
}

class _CienmaSeatState extends State<CienmaSeat> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          !widget.isReserved ? widget.isSelected = !widget.isSelected : null;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: widget.marginHorizontal,
            vertical: widget.marinVertical),
        width: widget.containerWidth,
        height: widget.containerHeight,
        decoration: BoxDecoration(
          color: widget.isSelected
              ? Selected
              : widget.isReserved
                  ? Colors.white
                  : null,
          border: !widget.isSelected && !widget.isReserved
              ? Border.all(color: Colors.white, width: 1.0)
              : null,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Icon(
          Icons.chair,
          size: widget.iconSize,
          color: widget.isSelected
              ? Selected
              : widget.isReserved
                  ? NOT_AVILABLE
                  : REGULAR,
        ),
      ),
    );
  }
}

/*

  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      CienmaSeat(),
                                      CienmaSeat(),
                                      CienmaSeat(),
                                      CienmaSeat(),
                                      SizedBox(
                                        width:
                                            (MediaQuery.of(context).size.width /
                                                    10) *
                                                2,
                                      ),
                                      CienmaSeat(
                                        isReserved: true,
                                      ),
                                      CienmaSeat(),
                                      CienmaSeat(),
                                    ],
                                  ),
                                  // Third  Row
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      CienmaSeat(),
                                      CienmaSeat(),
                                      CienmaSeat(),
                                      CienmaSeat(),
                                      SizedBox(
                                        width:
                                            (MediaQuery.of(context).size.width /
                                                    20) *
                                                2,
                                      ),
                                      CienmaSeat(),
                                      CienmaSeat(
                                        isReserved: true,
                                      ),
                                      CienmaSeat(
                                        isReserved: true,
                                      ),
                                    ],
                                  ),
                                  // 4TH Row
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      CienmaSeat(),
                                      CienmaSeat(),
                                      CienmaSeat(),
                                      CienmaSeat(),
                                      SizedBox(
                                        width:
                                            (MediaQuery.of(context).size.width /
                                                    20) *
                                                2,
                                      ),
                                      CienmaSeat(
                                        isReserved: true,
                                      ),
                                      CienmaSeat(),
                                      CienmaSeat(),
                                    ],
                                  ),
                                  // 5TH Row
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      CienmaSeat(),
                                      CienmaSeat(),
                                      CienmaSeat(),
                                      CienmaSeat(),
                                      SizedBox(
                                        width:
                                            (MediaQuery.of(context).size.width /
                                                    20) *
                                                2,
                                      ),
                                      CienmaSeat(),
                                      CienmaSeat(),
                                      CienmaSeat(),
                                    ],
                                  ),
                                  // 6TH Row
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      CienmaSeat(),
                                      CienmaSeat(),
                                      CienmaSeat(),
                                      CienmaSeat(),
                                      SizedBox(
                                        width:
                                            (MediaQuery.of(context).size.width /
                                                    20) *
                                                2,
                                      ),
                                      CienmaSeat(),
                                      CienmaSeat(),
                                      CienmaSeat(),
                                    ],
                                  ),
                                  // final Row
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        width:
                                            (MediaQuery.of(context).size.width /
                                                20),
                                      ),
                                      CienmaSeat(),
                                      CienmaSeat(),
                                      CienmaSeat(),
                                      SizedBox(
                                        width:
                                            (MediaQuery.of(context).size.width /
                                                    20) *
                                                2,
                                      ),
                                      CienmaSeat(),
                                      CienmaSeat(),
                                      SizedBox(
                                        width:
                                            (MediaQuery.of(context).size.width /
                                                20),
                                      ),
                                    ],
                                  ),
                                


*/