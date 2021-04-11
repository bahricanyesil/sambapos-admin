import 'package:flutter/material.dart';

int setPin(text, index, currentIndex, currentPins, controllers, focusNodes) {
  if (index != null) {
    currentIndex = index;
  }
  currentPins[currentIndex] = text;
  controllers[currentIndex].text = text;
  controllers[currentIndex].selection = TextSelection.fromPosition(
      TextPosition(offset: controllers[currentIndex].text.length));
  if (currentIndex != controllers.length - 1) {
    currentIndex = currentIndex + 1;
  }
  focusNodes[currentIndex].requestFocus();
  controllers[currentIndex].selection =
      TextSelection.fromPosition(TextPosition(offset: 0));
  return currentIndex;
}
