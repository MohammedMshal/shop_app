import 'package:flutter/material.dart';


class DefaultGridViewResponsive extends StatelessWidget {
  const DefaultGridViewResponsive({
    Key? key,
    required this.widgetContent,
    required this.itemCount,
    this.color
  }) : super(key: key);
  final Widget widgetContent;
  final int itemCount;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final double shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool useMobilLayOut = shortestSide < 600;
    final Orientation orientation = MediaQuery.of(context).orientation;

    return useMobilLayOut
        ? _buildGridMobile(
            orientation: orientation,
          )
        : _buildGridTablet(
            orientation: orientation,
          );
  }

  Widget _buildGridMobile({
    required Orientation orientation,
  }) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
      children: List.generate(
        itemCount,
        (index) => Card(
          color: color ,
          child: widgetContent,
        ),
      ),
    );
  }

  Widget _buildGridTablet({
    required Orientation orientation,
  }) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: orientation == Orientation.portrait ? 4 : 5,
      children: List.generate(
        itemCount,
        (index) => Card(
          child: widgetContent,
        )
      ),
    );
  }
}
