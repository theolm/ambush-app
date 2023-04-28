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
import 'package:invoice_app/src/core/data/repositories/bank_repository.dart'
    as _i5;
import 'package:invoice_app/src/core/data/repositories/company_repository.dart'
    as _i6;
import 'package:invoice_app/src/core/domain/usecases/get_bank_info.dart' as _i8;
import 'package:invoice_app/src/core/domain/usecases/get_company_address.dart'
    as _i9;
import 'package:invoice_app/src/core/domain/usecases/get_company_name.dart'
    as _i10;
import 'package:invoice_app/src/core/domain/usecases/save_bank_info.dart'
    as _i11;
import 'package:invoice_app/src/core/domain/usecases/save_company_address.dart'
    as _i12;
import 'package:invoice_app/src/core/domain/usecases/save_company_name.dart'
    as _i13;
import 'package:invoice_app/src/features/generate_pdf/data/repositories/pdf_template_repo.dart'
    as _i4;
import 'package:invoice_app/src/features/generate_pdf/domain/usecases/generate_invoice.dart'
    as _i7;
import 'package:invoice_app/src/features/settings/presentation/settings_viewmodel.dart'
    as _i14;

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
    gh.singleton<_i3.ILocalDataSource>(_i3.LocalDataSource());
    gh.factory<_i4.IPdfTemplateRepo>(() => _i4.PdfTemplateRepo());
    gh.singleton<_i5.IBankRepository>(
        _i5.BankRepository(gh<_i3.ILocalDataSource>()));
    gh.singleton<_i6.ICompanyRepository>(
        _i6.CompanyRepository(gh<_i3.ILocalDataSource>()));
    gh.factory<_i7.IGenerateInvoiceUseCase>(
        () => _i7.GenerateInvoiceUseCase(gh<_i4.IPdfTemplateRepo>()));
    gh.factory<_i8.IGetBankInfo>(
        () => _i8.GetBankInfo(gh<_i5.IBankRepository>()));
    gh.factory<_i9.IGetCompanyAddress>(
        () => _i9.GetCompanyAddress(gh<_i6.ICompanyRepository>()));
    gh.factory<_i10.IGetCompanyName>(
        () => _i10.GetCompanyName(gh<_i6.ICompanyRepository>()));
    gh.factory<_i11.ISaveBankInfo>(
        () => _i11.SaveBankInfo(gh<_i5.IBankRepository>()));
    gh.factory<_i12.ISaveCompanyAddress>(
        () => _i12.SaveCompanyAddress(gh<_i6.ICompanyRepository>()));
    gh.factory<_i13.ISaveCompanyName>(
        () => _i13.SaveCompanyName(gh<_i6.ICompanyRepository>()));
    gh.factory<_i14.SettingsViewModel>(() => _i14.SettingsViewModel(
          gh<_i10.IGetCompanyName>(),
          gh<_i9.IGetCompanyAddress>(),
          gh<_i8.IGetBankInfo>(),
          gh<_i13.ISaveCompanyName>(),
          gh<_i12.ISaveCompanyAddress>(),
          gh<_i11.ISaveBankInfo>(),
        ));
    return this;
  }
}
