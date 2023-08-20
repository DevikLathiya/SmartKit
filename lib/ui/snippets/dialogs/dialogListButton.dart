import 'package:flutter/material.dart';

class DialogListButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const DialogListButton({Key? key, required this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).colorScheme.background,
        ),
        width: MediaQuery.of(context).size.width * (0.85),
        height: 70,
        margin: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        child: LayoutBuilder(builder: (context, boxConstraints) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                  top: 0,
                  left: boxConstraints.maxWidth * (0.06),
                  right: boxConstraints.maxWidth * (0.06),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 27.5),
                              blurRadius: 30,
                              spreadRadius: 2.5,
                              color: Color(0xbf000000))
                        ],
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(
                                boxConstraints.maxWidth * (0.525)),
                            bottomLeft: Radius.circular(
                                boxConstraints.maxWidth * (0.525)))),
                    width: boxConstraints.maxWidth,
                    height: boxConstraints.maxHeight * (0.525),
                  )),
              Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    child: Center(
                      child: Text(title,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 22.0),
                          textAlign: TextAlign.left),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.5, horizontal: 20.0),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(15.0)),
                    width: boxConstraints.maxWidth,
                    height: boxConstraints.maxHeight,
                  )),
            ],
          );
        }),
      ),
    );
  }
}
