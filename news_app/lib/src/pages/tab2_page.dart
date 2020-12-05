import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/services/news_service.dart';
import 'package:news_app/src/theme/theme.dart';
import 'package:news_app/src/widgets/news_list.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: <Widget>[
          _CategoryList(),
          Expanded(child: NewsList(newsService.articlesSelectedCategory))
        ],
      )),
    );
  }
}

class _CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;
    return Container(
      width: double.infinity,
      height: 80.0,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            final catName = categories[index].name;

            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  _CategoryButton(category: categories[index]),
                  SizedBox(height: 5.0),
                  Text('${catName[0].toUpperCase()}${catName.substring(1)}'),
                ],
              ),
            );
          }),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category category;

  const _CategoryButton({required this.category});

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<NewsService>(context);
    return GestureDetector(
      onTap: () {
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = category.name;
      },
      child: Container(
          width: 40.0,
          height: 40.0,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: Icon(
            category.icon,
            color: (service.selectedCategory == category.name)
                ? myTheme.accentColor
                : Colors.black54,
          )),
    );
  }
}
