part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final ThemeData themeData;
  final bool isDark;

  ThemeState({
    required this.themeData,
    required this.isDark,
  });

  factory ThemeState.initial() {
    return ThemeState(
      themeData: ThemeData.light(),
      isDark: false,
    );
  }

  @override
  List<Object> get props => [themeData, isDark];

  @override
  String toString() {
    return 'ThemeState(themeData: $themeData, isDark: $isDark)';
  }

  ThemeState copyWith({
    ThemeData? themeData,
    bool? isDark,
  }) {
    return ThemeState(
      themeData: themeData ?? this.themeData,
      isDark: isDark ?? this.isDark,
    );
  }
}
