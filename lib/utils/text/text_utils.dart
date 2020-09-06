class TextUtils {
  ///将每个字符串之间插入零宽空格
  static String breakWord(String word) {
    if (word == null || word.isEmpty) {
      return word;
    }
    String breakWord = ' ';
    word.runes.forEach((element) {
      breakWord += String.fromCharCode(element);
      breakWord += '\u200B';
    });
    return breakWord;
  }

  static bool strNoteNull(String str) {
    bool flag = false;
    if (str != null && str.isNotEmpty) {
      flag = true;
    }
    return flag;
  }

  ///输出非空字符串
  static String outPutNoneNullStr(String str) {
    return strNoteNull(str) ? str : "";
  }
}
