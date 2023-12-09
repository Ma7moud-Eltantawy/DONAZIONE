import 'package:flutter/material.dart';
class Mbutton extends StatelessWidget {
  const Mbutton({

    required this.width,required this.height,required this.colors,required this.txt,
    required this.wid,required this.func, required this.txtcolor,
  });
  final double ?width;
  final double?height;
  final List<Color>? colors;
  final String? txt;
  final Widget? wid;
  final Function func;
  final Color? txtcolor;


  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: MediaQuery.of(context).size.width,
      height: height!/17,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors:colors!,

        ),
      ),
      child: MaterialButton(
        onPressed:func(),

        child: Container(
          padding: EdgeInsets.symmetric(horizontal: width!/160),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(

                mainAxisAlignment: MainAxisAlignment.end,
                children: [




                  Container(
                    height: height!/100,
                    width: width!/100,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 20,),
                  Text(txt!,style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: txtcolor,
                      fontSize: width!/30,
                      fontWeight: FontWeight.bold
                  ),),

                ],
              ),
              Container(
                child: wid,
              ),
            ],
          ),

        ),
      ),
    );
  }
}
