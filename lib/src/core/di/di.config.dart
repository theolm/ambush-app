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
import 'package:invoice_app/src/features/generate_pdf/data/repositories/pdf_template_repo.dart'
    as _i3;
import 'package:invoice_app/src/features/generate_pdf/domain/usecases/generate_invoice.dart'
    as _i6;
import 'package:invoice_app/src/features/onboarding/presentation/my_comp/my_company_viewmodel.dart'
    as _i4;
import 'package:invoice_app/src/features/settings/presentation/settings_viewmodel.dart'
    as _i5;

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
    gh.factory<_i3.IPdfTemplateRepo>(() => _i3.PdfTemplateRepo());
    gh.factory<_i4.MyCompanyViewModel>(() => _i4.MyCompanyViewModel());
    gh.factory<_i5.SettingsViewModel>(() => _i5.SettingsViewModel());
    gh.factory<_i6.IGenerateInvoiceUseCase>(
        () => _i6.GenerateInvoiceUseCase(gh<_i3.IPdfTemplateRepo>()));
    return this;
  }
}
