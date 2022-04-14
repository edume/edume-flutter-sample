# eduMe demo code for Flutter (Dart)

This is a small snippet of code written in Dart language for the Flutter framework, which will generate a seamless link using the “base link” that can be obtained from admin.edume.com.

The snippet demonstrates how to create the signature and append it to the base link. For reference, A base link might look like https://learn.edume.com/e/m/24512?g=12345 - to make it into a seamless link, the identifier and secret need to be added. I hope this script is useful.
Use the code as follows;

Require to add `crypto` to `pubspec.yaml`

```Dart
// Note: the shared secret will be given by edume
const String sharedSecret = 'c4e867ae-bc05-11ec-8422-0242ac120002';
const String employeeId = "employee-id";
const String baseLink = "https://learn.edume.com/e/m/24512?g=12345";
String seamlessLink = EduMe(sharedSecret).createSeamlessLink(employeeId, baseLink);
```