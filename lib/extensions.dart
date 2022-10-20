//This extension which add an additional functionality to the type of variable you want
//for example we are adding a function to capitalize the first letter
extension MyExtension on String{
  String capitalize(){
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }

  String removeHTMLTags(){
    RegExp exp = RegExp(r"<[^>]*>",multiLine: true,caseSensitive: true);
    String parsedString = this.replaceAll(exp, '');

    return parsedString;
  }
}


