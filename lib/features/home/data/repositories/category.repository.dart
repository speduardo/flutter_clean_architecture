import 'package:fluttercleanarchitecture/core/data/models/generic.model.dart';
import 'package:fluttercleanarchitecture/features/home/data/datasources/category.datasource.dart';
import 'package:fluttercleanarchitecture/features/home/domain/repositories/icategory.repository.dart';

class CategoryRepository implements ICategoryRepository {

  final CategoryDataSource dataSource;

  CategoryRepository({this.dataSource});

  @override
  Future<void> save(GenericModel model) {
    this.dataSource.save(model);
  }

  @override
  Future<void> delete(GenericModel model) {
    this.dataSource.delete(model);
  }

  @override
  Future<List<GenericModel>> getAll() async {
    return await this.dataSource.getAll();
  }

}