import 'package:flutter/material.dart';
import 'package:movie_app/constraints.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});
  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectCategory = 0;
  List<String> categories = ['Showing', 'Box Office', 'Coming Soon'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 0.5,
          width: 10,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
          height: 45,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) =>
                  buildCategory(categories, index, context)),
        ),
      ],
    );
  }

  Padding buildCategory(
      List<String> categories, int index, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectCategory = index;
          });
        },
        child: Column(
          children: [
            Text(
              categories[index],
              style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Kanit',
                  color: index == selectCategory
                      ? kTextColor
                      : Colors.black.withOpacity(0.4)),
            ),
            Container(
              height: 6,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: index == selectCategory
                      ? kSecondaryColor
                      : Colors.transparent),
            )
          ],
        ),
      ),
    );
  }
}
