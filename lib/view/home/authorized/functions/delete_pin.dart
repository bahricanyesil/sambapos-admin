import 'package:flutter/material.dart';

int deletePin(currentIndex, currentPins, controllers, focusNodes) {
  currentPins[currentIndex] = '';
  controllers[currentIndex].text = '';
  controllers[currentIndex].selection =
      TextSelection.fromPosition(TextPosition(offset: 0));
  if (currentIndex != 0) {
    currentIndex = currentIndex - 1;
  }
  focusNodes[currentIndex].requestFocus();
  return currentIndex;
}
