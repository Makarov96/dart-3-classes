import 'package:about_dart_3/sealed_classes.dart';

Future<void> main() async {
  final data = await getData();

  data.when(
    (err) => print(err),
    () => print('Loading.....'),
    (ok) => print(ok.length),
  );
}

Future<Either<Failure, List<String>>> getData() async {
  try {
    await Future.delayed(const Duration(milliseconds: 4000));

    return Either.ok(['Steven', 'Darwin', 'Frank']);
  } catch (e) {
    return Either.err(ServerFailure());
  }
}
