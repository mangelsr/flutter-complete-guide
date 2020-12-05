import 'package:flutter/material.dart';

import 'package:news_app/src/models/news_models.dart';
import 'package:news_app/src/theme/theme.dart';

class NewsList extends StatelessWidget {
  final List<Article> news;

  const NewsList(this.news);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.news.length,
      itemBuilder: (BuildContext context, int index) {
        return _New(article: this.news[index], index: index);
      },
    );
  }
}

class _New extends StatelessWidget {
  final Article article;
  final int index;

  const _New({required this.article, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _CardTopBar(article: this.article, index: this.index),
        _CardTitle(article: this.article),
        _CardImage(article: this.article),
        _CardBody(article: this.article),
        _CardFooter(),
        SizedBox(height: 10.0),
        Divider(),
      ],
    );
    // return Text(this.article.title);
  }
}

class _CardTopBar extends StatelessWidget {
  final Article article;
  final int index;

  const _CardTopBar({required this.article, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: <Widget>[
          Text(
            '${this.index + 1}',
            style: TextStyle(color: myTheme.accentColor),
          ),
          Text('${this.article.source.name}'),
        ],
      ),
    );
  }
}

class _CardFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {},
            fillColor: myTheme.accentColor,
            child: Icon(Icons.star_border),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
          ),
          SizedBox(width: 10.0),
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.blue,
            child: Icon(Icons.more),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
          ),
        ],
      ),
    );
  }
}

class _CardTitle extends StatelessWidget {
  final Article article;

  const _CardTitle({required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Text(
          this.article.title,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ));
  }
}

class _CardBody extends StatelessWidget {
  final Article article;

  const _CardBody({required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text((this.article.description != null)
          ? this.article.description.toString()
          : ''),
    );
  }
}

class _CardImage extends StatelessWidget {
  final Article article;

  const _CardImage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        ),
        child: Container(
            child: (this.article.urlToImage != null)
                ? FadeInImage(
                    placeholder: AssetImage('assets/img/giphy.gif'),
                    image: NetworkImage(this.article.urlToImage.toString()),
                  )
                : Image(image: AssetImage('assets/img/no-image.png'))),
      ),
    );
  }
}
