// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ui_store_design/extensions.dart';
// import 'package:flutter/widgets.dart';

// import 'color_scheme.dart';
// import 'colors.dart';
// import 'expansion_tile_theme.dart';
// import 'icons.dart';
// import 'list_tile.dart';
// import 'list_tile_theme.dart';
// import 'theme.dart';

const Duration _kExpand = Duration(milliseconds: 200);


class CustomExpansionTile extends StatefulWidget {

  const CustomExpansionTile({
    this.leading,
    this.subtitle,
    this.onExpansionChanged,
    // this.children = const <Widget>[],
    required this.text,
    required this.textStyle,
    this.trailing,
    this.initiallyExpanded = false,
    this.maintainState = false,
    this.tilePadding,
    this.expandedCrossAxisAlignment,
    this.expandedAlignment,
    this.childrenPadding,
    this.backgroundColor,
    this.collapsedBackgroundColor,
    this.textColor,
    this.collapsedTextColor,
    this.iconColor,
    this.collapsedIconColor,
    this.controlAffinity, required this.width,
  }) : assert(initiallyExpanded != null),
        assert(maintainState != null),
        assert(
        expandedCrossAxisAlignment != CrossAxisAlignment.baseline,
        'CrossAxisAlignment.baseline is not supported since the expanded children '
            'are aligned in a column, not a row. Try to use another constant.',
        );


  final Widget? leading;

  final double width;

  final Widget? subtitle;

  final ValueChanged<bool>? onExpansionChanged;

  final String text;

  final TextStyle textStyle;

  final Color? backgroundColor;

  final Color? collapsedBackgroundColor;

  final Widget? trailing;

  final bool initiallyExpanded;

  final bool maintainState;

  final EdgeInsetsGeometry? tilePadding;

  final Alignment? expandedAlignment;

  final CrossAxisAlignment? expandedCrossAxisAlignment;

  final EdgeInsetsGeometry? childrenPadding;

  final Color? iconColor;

  final Color? collapsedIconColor;

  final Color? textColor;

  final Color? collapsedTextColor;

  final ListTileControlAffinity? controlAffinity;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeOutTween = CurveTween(curve: Curves.easeOut);
  static final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween = Tween<double>(begin: 0.0, end: 0.5);

  final ColorTween _borderColorTween = ColorTween();
  final ColorTween _headerColorTween = ColorTween();
  final ColorTween _iconColorTween = ColorTween();
  final ColorTween _backgroundColorTween = ColorTween();

  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;
  late Animation<Color?> _borderColor;
  late Animation<Color?> _headerColor;
  late Animation<Color?> _iconColor;
  late Animation<Color?> _backgroundColor;

  late LineSplitter ls;
  late String title;
  late String content;
  late TextPainter textPainter;


  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    _borderColor = _controller.drive(_borderColorTween.chain(_easeOutTween));
    _headerColor = _controller.drive(_headerColorTween.chain(_easeInTween));
    _iconColor = _controller.drive(_iconColorTween.chain(_easeInTween));
    _backgroundColor = _controller.drive(_backgroundColorTween.chain(_easeOutTween));

    _isExpanded = PageStorage.of(context)?.readState(context) as bool? ?? widget.initiallyExpanded;
    if (_isExpanded) {
      _controller.value = 1.0;
    }

    getRawText(widget.text, widget.textStyle, widget.width);




    // textPainter = TextPainter(
    //     textDirection: TextDirection.ltr,
    //     textScaleFactor: MediaQuery.textScaleFactorOf(context));
    //
    // textPainter.text = TextSpan(
    //     text: widget.text,
    //     style: widget.textStyle);
    //
    // double lineHeight = textPainter.preferredLineHeight;


  }

  List<String> firstTexts = [];
  List<String> secondTexts = [];



  getRawText(String text, TextStyle textStyle, double width){
    // The TextPaint has already been laid out

    final textSpan = TextSpan(text: text, style: textStyle);

    final _textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    _textPainter.layout(
      minWidth: 0,
      maxWidth: width,
    );

    // select everything
    TextSelection selection = TextSelection(baseOffset: 0, extentOffset: textSpan.text!.length);

    // get a list of TextBoxes (Rects)
    List<LineMetrics> lineMetrics = _textPainter.computeLineMetrics();

    // Loop through each text box
    List<String> lineTexts = [];


    int start = 0;
    int end;
    int index = -1;
    for (int i = 0; i < lineMetrics.length; i++) {
      LineMetrics lineMetric = lineMetrics[i];
      index += 1;

      // Uncomment this if you want to only get the whole line of text
      // (sometimes a single line may have multiple TextBoxes)
      // if (box.left != 0.0)
      //  continue;

      if (index == 0)
        continue;
      // Go one logical pixel within the box and get the position
      // of the character in the string.
      final top = lineMetric.baseline - lineMetric.ascent;
      end = _textPainter.getPositionForOffset(Offset(lineMetric.left + 1, top + 1)).offset;
      // add the substring to the list of lines
      final line = text.substring(start, end);

      if(i < 4){
        // print("this is line no: $i, and text line: $line");
        firstTexts.add(line);
      }

      if(i > 3){
        // print("this is line no: $i, and text line: $line");
        secondTexts.add(line);
      }

      lineTexts.add(line);
      start = end;
    }
    // get the last substring
    final extra = text.substring(start);
    // print("this is last line: ${text.substring(start)}");
    secondTexts.add(extra);
    lineTexts.add(extra);
    // print("this is the first texts: $firstTexts");
    // print("this is the second texts: $secondTexts");
    return lineTexts.join(" ");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) {
            return;
          }
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.of(context)?.writeState(context, _isExpanded);
    });
    widget.onExpansionChanged?.call(_isExpanded);
  }

  // Platform or null affinity defaults to trailing.
  ListTileControlAffinity _effectiveAffinity(ListTileControlAffinity? affinity) {
    switch (affinity ?? ListTileControlAffinity.trailing) {
      case ListTileControlAffinity.leading:
        return ListTileControlAffinity.leading;
      case ListTileControlAffinity.trailing:
      case ListTileControlAffinity.platform:
        return ListTileControlAffinity.trailing;
    }
  }

  bool hasTextOverflow(
      String text,
      TextStyle style,
      {double minWidth = 0,
        double maxWidth = double.infinity,
        int maxLines = 3
      }) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: minWidth, maxWidth: maxWidth);


    return textPainter.didExceedMaxLines;
  }

  Widget? _buildIcon(BuildContext context, Color? iconColor) {
    return RotationTransition(
      turns: _iconTurns,
      child: Icon(Icons.arrow_drop_down_circle_outlined, color: iconColor,),
    );
  }





// Widget? _buildLeadingIcon(BuildContext context) {
  //   if (_effectiveAffinity(widget.controlAffinity) != ListTileControlAffinity.leading) {
  //     return null;
  //   }
  //   return _buildIcon(context);
  // }
  //
  // Widget? _buildTrailingIcon(BuildContext context) {
  //   if (_effectiveAffinity(widget.controlAffinity) != ListTileControlAffinity.trailing) {
  //     return null;
  //   }
  //   return _buildIcon(context);
  // }
  Widget _buildChildren(BuildContext context, Widget? child) {
    // Widget _buildChildren(BuildContext context, Widget? child, Widget? middleChild) {
    final ExpansionTileThemeData expansionTileTheme = ExpansionTileTheme.of(context);
    final Color borderSideColor = _borderColor.value ?? Colors.transparent;


    return Container(
      decoration: BoxDecoration(
        color: _backgroundColor.value ?? expansionTileTheme.backgroundColor ?? Colors.transparent,
        border: Border(
          top: BorderSide(color: borderSideColor),
          bottom: BorderSide(color: borderSideColor),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTileTheme.merge(
            iconColor: _iconColor.value ?? expansionTileTheme.iconColor,
            textColor: _headerColor.value,
            child: GestureDetector(
              onTap: _handleTap,
              child: Container(
                padding: widget.tilePadding ?? expansionTileTheme.tilePadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _isExpanded ? Html(data: firstTexts.join("")) : Text(firstTexts.join("").removeHTMLTags(),style: widget.textStyle, maxLines: 3, overflow: _isExpanded ? null : TextOverflow.fade, textAlign: TextAlign.left,),
                    // widget.title,
                    // middleChild ?? Container(),
                    //This is the widget is built in the middle with animation
                    ClipRect(
                      child: Align(
                        alignment: widget.expandedAlignment
                            ?? expansionTileTheme.expandedAlignment
                            ?? Alignment.center,
                        heightFactor: _heightFactor.value,
                        //This is the content which is build in the middle
                        child: child,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 2,
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: _buildIcon(context, _iconColor.value ?? expansionTileTheme.iconColor) ?? Container(),
                        ),
                        Expanded(
                          child: Container(
                            height: 2,
                            width: 20,
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }


  @override
  void didChangeDependencies() {
    final ThemeData theme = Theme.of(context);
    final ExpansionTileThemeData expansionTileTheme = ExpansionTileTheme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    _borderColorTween.end = theme.dividerColor;
    _headerColorTween
      ..begin = widget.collapsedTextColor
          ?? expansionTileTheme.collapsedTextColor
          ?? theme.textTheme.subtitle1!.color
      ..end = widget.textColor ?? expansionTileTheme.textColor ?? colorScheme.primary;
    _iconColorTween
      ..begin = widget.collapsedIconColor
          ?? expansionTileTheme.collapsedIconColor
          ?? theme.unselectedWidgetColor
      ..end = widget.iconColor ?? expansionTileTheme.iconColor ?? colorScheme.primary;
    _backgroundColorTween
      ..begin = widget.collapsedBackgroundColor ?? expansionTileTheme.collapsedBackgroundColor
      ..end = widget.backgroundColor ?? expansionTileTheme.backgroundColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final ExpansionTileThemeData expansionTileTheme = ExpansionTileTheme.of(context);
    final bool closed = !_isExpanded && _controller.isDismissed;
    final bool shouldRemoveChildren = closed && !widget.maintainState;


    // print(widget.text);
    // print("this is the number of lines in the product description: ${lines.length}");

    final Widget result = Offstage(
      offstage: closed,
      child: TickerMode(
        enabled: !closed,
        child: Padding(
          padding: widget.childrenPadding ?? expansionTileTheme.childrenPadding ?? EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: widget.expandedCrossAxisAlignment ?? CrossAxisAlignment.center,
            children: [
              Html(data: secondTexts.join("")),
              // Text(secondTexts.join(""), style: widget.textStyle,),
            ],
          ),
        ),
      ),
    );

    // return hasTextOverflow(widget.text, widget.textStyle, maxLines: 3) ? AnimatedBuilder(
    return secondTexts.isNotEmpty ? AnimatedBuilder(
      animation: _controller.view,
      builder: (context, child){
        return _buildChildren(context, child);

        // return _buildChildren(context, child, result);
      },
      child: shouldRemoveChildren ? null : result,)
     : Text(firstTexts.join(""), style: widget.textStyle,);
  }
}
