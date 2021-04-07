import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swapper/const.dart';
import 'package:swapper/models/swap_stuff.dart';
import 'package:swapper/views/switch-swap/feedback_position_provider.dart';

class UserCardWidget extends StatelessWidget {
  final UserStuff user;
  final bool isUserInFocus;

  const UserCardWidget({
    @required this.user,
    @required this.isUserInFocus,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FeedbackPositionProvider>(context);
    final swipingDirection = provider.swipingDirection;
    final size = MediaQuery.of(context).size;

    return Container(
      height: 510,
      width: size.width / 1.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: white
      ),
      child: Column(
        children: [
          Container(
            width: size.width / 1.19,
            height: 310,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('${user.imgUrl}'),
                fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              children: [
                Container(
                  height: 85,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(30, 30, 30, 0.45),
                    borderRadius: BorderRadius.only(
                      bottomLeft:Radius.circular(20), 
                      bottomRight :Radius.circular(20))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${user.title}',
                          style: TextStyle(
                            color: white,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        ),
                        Text(
                          'Alima Zhakupova',
                          style: TextStyle(
                            color: white,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.normal,
                            fontSize: 15
                          ),
                        ),
                        Text(
                          'Astana, Kazakhstan',
                          style: TextStyle(
                            color: white,
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.normal,
                            fontSize: 15
                          ),
                        )
                    ],),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Stack(
              children: [
                Positioned(
                  right: 10,
                  left: 10,
                  bottom: 10,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildUserInfo(user: user),
                      Padding(
                        padding: EdgeInsets.only(bottom: 16, right: 8),
                        child: Icon(Icons.info, color: Colors.white),
                      )
                    ],
                  ),
                ),
                if (isUserInFocus) buildLikeBadge(swipingDirection)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLikeBadge(SwipingDirection swipingDirection) {
    final isSwipingRight = swipingDirection == SwipingDirection.right;
    final color = isSwipingRight ? Colors.green : Colors.pink;
    final angle = isSwipingRight ? -0.5 : 0.5;

    if (swipingDirection == SwipingDirection.none) {
      return Container();
    } else {
      return Positioned(
        top: 20,
        right: isSwipingRight ? null : 20,
        left: isSwipingRight ? 20 : null,
        child: Transform.rotate(
          angle: angle,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: color, width: 2),
            ),
            child: Text(
              isSwipingRight ? 'LIKE' : 'NOPE',
              style: TextStyle(
                color: color,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget buildUserInfo({@required UserStuff user}) => Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${user.title}, ${user.category}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Text(
              user.description,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 4),
            Text(
              '${user.preferedSwaps} Prefered Swaps',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      );
}
