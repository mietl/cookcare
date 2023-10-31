import 'package:cookcare/core/utils/extension.dart';
import 'package:cookcare/ui/screen/filter/filter_screen.dart';
import 'package:flutter/material.dart';

class LMDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16, // 设置较大的抽屉高度
      child: Column(
        children: [
          buildHeader(context),
          Divider(
            // 分割线
          ),
          buildListTile(Icon(Icons.restaurant),'进食'),
          buildListTile(Icon(Icons.filter_alt),'过滤',onPressed: ()=>{
            Navigator.pushNamed(context, FilterScreen.routeName)
          }),
        ],
      ),
    );
  }

  Widget buildHeader(context){
    return Container(
      width: double.infinity,
      height: 76.px,
      alignment: Alignment(-1,1),
      margin: EdgeInsets.only(bottom: 12.px,left: 12.px),
        child: Text('行动',style:Theme.of(context).textTheme.headlineMedium)
    );
  }

  Widget buildListTile(icon,title,{onPressed}){
    return ListTile(
      leading: icon,
      title:Text(title),
      onTap: onPressed,
    );
  }
}