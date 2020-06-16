import 'package:fluttercleanarchitecture/features/home/data/models/estabelecimento.model.dart';
import 'package:fluttercleanarchitecture/features/home/data/repositories/estabelecimento.repository.dart';
import 'package:fluttercleanarchitecture/features/home/domain/entities/estabelecimento.entity.dart';

class EstabelecimentoUseCase {

  EstabelecimentoRepository repository;

  EstabelecimentoUseCase({EstabelecimentoRepository repository}) {
    this.repository = repository;
  }
  
  Future<List<EstabelecimentoEntity>> getAll() async {
    List<EstabelecimentoModel> list = await this.repository.getAll();
    List<EstabelecimentoEntity> entityList = [];
    EstabelecimentoEntity entity;

    return List.generate(list.length, (index) {
      return EstabelecimentoEntity(
        nome: list[index].nome,
        descricao: list[index].descricao,
      );
    });
  }


}