import 'package:flutter/material.dart';

void goTo({required BuildContext context,required Widget screen})
{
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) =>  screen,),
  );
}