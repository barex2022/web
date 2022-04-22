import 'package:barex_website/constants/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bloc/menu_item/menu_item_cubit.dart';
import '../routes/routes.dart';
import 'nav_item_with_hover.dart';


class NavigationBarWeb extends StatelessWidget {
  List<String> items;

  NavigationBarWeb(this.items);


 Widget item(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child:Text(
        text,
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,

      child: Row(

        mainAxisAlignment: MainAxisAlignment.end,
          children:List.generate(items.length, (index) => InkWell(
              onTap: (){
                BlocProvider.of<MenuItemCubit>(context).selectIndex(index);
              },
              child: InteractiveNavItem(text:items[index],routeName:  routeHome, selected: index == 0, )))
    ),);
  }
}