// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:invoice_app/src/core/data/datasources/local_datasource.dart'
    as _i3;
import 'package:invoice_app/src/core/data/repositories/company_repository.dart'
    as _i7;
import 'package:invoice_app/src/core/domain/usecases/get_company_name.dart'
    as _i9;
import 'package:invoice_app/src/features/generate_pdf/data/repositories/pdf_template_repo.dart'
    as _i4;
import 'package:invoice_app/src/features/generate_pdf/domain/usecases/generate_invoice.dart'
    as _i8;
import 'package:invoice_app/src/features/onboarding/presentation/my_comp/my_company_viewmodel.dart'
    as _i5;
import 'package:invoice_app/src/features/settings/presentation/settings_viewmodel.dart'
    as _i6;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.ILocalDataSource>(() => _i3.LocalDataSource());
    gh.factory<_i4.IPdfTemplateRepo>(() => _i4.PdfTemplateRepo());
    gh.factory<_i5.MyCompanyViewModel>(() => _i5.MyCompanyViewModel());
    gh.factory<_i6.SettingsViewModel>(() => _i6.SettingsViewModel());
    gh.factory<_i7.ICompanyRepository>(
        () => _i7.CompanyRepository(gh<_i3.ILocalDataSource>()));
    gh.factory<_i8.IGenerateInvoiceUseCase>(
        () => _i8.GenerateInvoiceUseCase(gh<_i4.IPdfTemplateRepo>()));
    gh.factory<_i9.IGetCompanyName>(
        () => _i9.GetCompanyName(gh<_i7.ICompanyRepository>()));
    return this;
  }
}
