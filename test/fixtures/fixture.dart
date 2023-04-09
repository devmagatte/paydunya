import 'dart:io';

/// Get the json test
/// by [name] file
String fixture(String name) =>
    File('test/fixtures/json/$name').readAsStringSync();

String? fixtureNullSafety(String name) =>
    File('test/fixtures/json/$name').readAsStringSync();
