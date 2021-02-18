import 'package:flutter/material.dart';
import 'package:swapper/models/swap_event.dart';
import 'package:swapper/const.dart';

class SwapEventCardWidget extends StatelessWidget {
  final SwapEvent event;
  final bool isEventInFocus;

  const SwapEventCardWidget({
    @required this.event,
    @required this.isEventInFocus,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 1.12,
        height: 135,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: white,
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  offset: Offset(3, 4),
                  blurRadius: 7)
            ]),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${event.title}',
                style: TextStyle(
                    color: green,
                    fontFamily: 'Arial',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Container(
                    width: 150,
                    height: 92,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('${event.imageURL}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(children: [])
                ],
              )
            ],
          ),
        ));
  }
}
