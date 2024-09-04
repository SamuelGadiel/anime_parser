import 'package:dio/dio.dart';

import '../../modules/authentication/domain/usecases/get_authentication.dart';
import '../../modules/authentication/external/datasources/authentication_datasource_implementation.dart';
import '../../modules/authentication/infrastructure/repositories/authentication_repository_implementation.dart';
import '../../modules/authentication/presentation/controllers/authentication_controller.dart';
import '../../modules/notion/domain/usecases/submit_notion_data.dart';
import '../../modules/notion/external/datasource/notion_datasource_implementation.dart';
import '../../modules/notion/infrastructure/repositories/notion_repositories_implementation.dart';
import '../../modules/notion/presentation/controllers/notion_controller.dart';
import '../architecture/presentation/controllers/app_controller.dart';

final appController = AppController();

final Dio dio = Dio();

final _notionDatasource = NotionDatasourceImplementation(dio);
final _notionRepository = NotionRepositoryImplementation(_notionDatasource);
final _notionUsecase = SubmitNotionDataImplementation(_notionRepository);
final notionController = NotionController(_notionUsecase);

final _authenticationDatasource = AuthenticationDatasourceImplementation(dio);
final _authenticationRepository = AuthenticationRepositoryImplementation(_authenticationDatasource);
final _authenticationUsecase = GetAuthenticationImplementation(_authenticationRepository);
final authenticationController = AuthenticationController(_authenticationUsecase);
