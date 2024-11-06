
import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    super.key,
    required this.name
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 35, 
             fontFamily: 'Times New Roman'
            ),
          ),
          const Divider(
            height: 35,
            thickness: 6,
            color: Color(0xffFF903D),
          )
        ],
      
      ),
    );
  }
}

/*SliverToBoxAdapter(
              child: Text(
                'News',
                style: TextStyle(
                  fontSize: 40, 
                  fontFamily: 'Times New Roman'
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Divider(
                thickness: 7,
                color: Color(0xffFF903D),
              ),
            ),*/