import 'package:cookcare/core/provider/filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterView extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        buildTitle(),
        buildSettingList()
      ],
    );
  }

  buildTitle(){
    return Container(
      child: Text('排除规则'),
    );
  }


  buildSettingList(){
    return Expanded(child:
      Consumer<FilterProvider>(
        builder: (ctx,vm,child) {
          return ListView(
              children: [
                buildSettingTile(
                    title: '五谷蛋白',
                    subtitle: '提供身体所需的蛋白质',
                    value: vm.isGlutenFree,
                    onChanged: (value) {
                        vm.isGlutenFree = value;
                    }
                ),
                buildSettingTile(
                    title: '不含乳糖',
                    subtitle: '避免引发乳糖相关的消化不适',
                    value: vm.isLactoseFree,
                    onChanged: (value) {
                      vm.isLactoseFree = value;
                    }
                ),
                buildSettingTile(
                    title: '纯素食主义',
                    subtitle: '吃不了一点肉',
                    value: vm.isVegan,
                    onChanged: (value) {
                      vm.isVegan = value;
                    }
                ),
                buildSettingTile(
                    title: '素食主义',
                    subtitle: '不食用任何形式的动物肉类，然而，他们可能会食用动物产品，如蛋、奶制品和蜂蜜',
                    value: vm.isVegetarian,
                    onChanged: (value) {
                      vm.isVegetarian = value;
                    }
                )
              ]);
        }
      )
    );
  }

  buildSettingTile({required String title,required String subtitle,required bool value,Function(bool)? onChanged}){
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}