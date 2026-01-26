import 'package:flutter/material.dart';
import '../models/space.dart';
import '../services/space_service.dart';

class SpaceProvider extends ChangeNotifier {
  final SpaceService _service = SpaceService();

  List<Space> spaces = [];
  bool isLoading = false;
  String? error;

  Future<void> getRecommendedSpaces() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      spaces = await _service.fetchRecommendedSpaces();
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
