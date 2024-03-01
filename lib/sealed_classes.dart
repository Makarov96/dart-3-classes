sealed class Either<L, R> {
  const Either();
  factory Either.ok(R ok) => Ok(ok: ok);
  factory Either.err(L err) => Err(err: err);

  bool get isErr => switch (this) {
        Ok() => false,
        Err() => true,
      };

  bool get isOk => switch (this) {
        Ok() => true,
        Err() => false,
      };
  B fold<B>(B Function(L) l, B Function(R) r);
  B when<B>(B Function(L) l, B Function() loading, B Function(R) r) {
    return loading();
  }
}

class Ok<L, R> extends Either<L, R> {
  const Ok({required this.ok});
  final R ok;

  @override
  B fold<B>(B Function(L p1) l, B Function(R p1) r) {
    return r(ok);
  }

  @override
  B when<B>(B Function(L p1) l, B Function() loading, B Function(R p1) r) {
    loading();
    return r(ok);
  }
}

class Err<L, R> extends Either<L, R> {
  const Err({required this.err});
  final L err;

  @override
  B fold<B>(B Function(L p1) l, B Function(R p1) r) {
    return l(err);
  }

  @override
  B when<B>(B Function(L p1) l, B Function() loading, B Function(R p1) r) {
    loading();
    return l(err);
  }
}

sealed class Failure {}

class ServerFailure extends Failure {}
