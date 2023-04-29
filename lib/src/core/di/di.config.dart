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
    as _i5;
import 'package:invoice_app/src/core/data/repositories/bank_repository.dart'
    as _i7;
import 'package:invoice_app/src/core/data/repositories/company_repository.dart'
    as _i8;
import 'package:invoice_app/src/core/domain/usecases/get_bank_info.dart'
    as _i10;
import 'package:invoice_app/src/core/domain/usecases/get_company_address.dart'
    as _i11;
import 'package:invoice_app/src/core/domain/usecases/get_company_name.dart'
    as _i12;
import 'package:invoice_app/src/core/domain/usecases/save_bank_info.dart'
    as _i13;
import 'package:invoice_app/src/core/domain/usecases/save_company_address.dart'
    as _i14;
import 'package:invoice_app/src/core/domain/usecases/save_company_name.dart'
    as _i15;
import 'package:invoice_app/src/features/add_invoice/presentation/add_invoice_viewmodel.dart'
    as _i3;
import 'package:invoice_app/src/features/generate_pdf/data/repositories/pdf_template_repo.dart'
    as _i6;
import 'package:invoice_app/src/features/generate_pdf/domain/usecases/generate_invoice.dart'
    as _i9;
import 'package:invoice_app/src/features/settings/presentation/basic/basic_info_viewmodel.dart'
    as _i4;
import 'package:invoice_app/src/features/settings/presentation/settings_viewmodel.dart'
    as _i16;

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
    gh.factory<_i3.AddInvoiceViewModel>(() => _i3.AddInvoiceViewModel());
    gh.factory<_i4.BasicInfoViewModel>(() => _i4.BasicInfoViewModel());
    gh.singleton<_i5.ILocalDataSource>(_i5.LocalDataSource());
    gh.factory<_i6.IPdfTemplateRepo>(() => _i6.PdfTemplateRepo());
    gh.singleton<_i7.IBankRepository>(
        _i7.BankRepository(gh<_i5.ILocalDataSource>()));
    gh.singleton<_i8.ICompanyRepository>(
        _i8.CompanyRepository(gh<_i5.ILocalDataSource>()));
    gh.factory<_i9.IGenerateInvoiceUseCase>(
        () => _i9.GenerateInvoiceUseCase(gh<_i6.IPdfTemplateRepo>()));
    gh.factory<_i10.IGetBankInfo>(
        () => _i10.GetBankInfo(gh<_i7.IBankRepository>()));
    gh.factory<_i11.IGetCompanyAddress>(
        () => _i11.GetCompanyAddress(gh<_i8.ICompanyRepository>()));
    gh.factory<_i12.IGetCompanyName>(
        () => _i12.GetCompanyName(gh<_i8.ICompanyRepository>()));
    gh.factory<_i13.ISaveBankInfo>(
        () => _i13.SaveBankInfo(gh<_i7.IBankRepository>()));
    gh.factory<_i14.ISaveCompanyAddress>(
        () => _i14.SaveCompanyAddress(gh<_i8.ICompanyRepository>()));
    gh.factory<_i15.ISaveCompanyName>(
        () => _i15.SaveCompanyName(gh<_i8.ICompanyRepository>()));
    gh.factory<_i16.SettingsViewModel>(() => _i16.SettingsViewModel(
          gh<_i12.IGetCompanyName>(),
          gh<_i11.IGetCompanyAddress>(),
          gh<_i10.IGetBankInfo>(),
          gh<_i15.ISaveCompanyName>(),
          gh<_i14.ISaveCompanyAddress>(),
          gh<_i13.ISaveBankInfo>(),
        ));
    return this;
  }
}
