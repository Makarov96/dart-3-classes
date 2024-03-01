abstract interface class DataSource {
  const DataSource();
  Future<String> getString();
}

base class DataSourceImpl extends DataSource {
  const DataSourceImpl();
  @override
  Future<String> getString() => Future.value('Hello world');
}

class Origin {
  const Origin({required this.dataSource});
  final DataSource dataSource;
}

void main() async {
  final origin = Origin(dataSource: DataSourceImpl());

  print(await origin.dataSource.getString());
}
