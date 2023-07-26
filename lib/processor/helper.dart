class Helpers {
  static keyStroke({
    required String currenttext,
    required String stroke,
  }) {
    // currenttext represents the present text or variable
    // stoke represents the new text or number pressed by user
    String result = '';
    switch (stroke) {
      case 'backspace':
        {
          if (currenttext.length > 1) {
            result = currenttext.substring(0, currenttext.length - 1);
          }
        }
        break;
      case 'C':
        result = '';
        break;
      case '.':
        {
          if (currenttext.contains('.')) {
            result = currenttext;
          } else {
            result = currenttext + '.';
          }
        }
      default:
        result = currenttext + stroke;
    }
    return result;
  }
}

getUnit() async {}
