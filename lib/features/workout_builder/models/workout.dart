import 'package:personal_trainer_consultant/features/workout_builder/models/exercise.dart';

class Workout {
  final String name;
  final List<Exercise> exercises;

  Workout({
    required this.name,
    required this.exercises,
  });

  Workout copyWith({
    String? name,
    List<Exercise>? exercises,
  }) {
    return Workout(
      name: name ?? this.name,
      exercises: exercises ?? this.exercises,
    );
  }
}
