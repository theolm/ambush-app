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
    as _i7;
import 'package:invoice_app/src/core/data/repositories/bank_repository.dart'
    as _i10;
import 'package:invoice_app/src/core/data/repositories/company_repository.dart'
    as _i11;
import 'package:invoice_app/src/core/domain/usecases/get_bank_info.dart'
    as _i13;
import 'package:invoice_app/src/core/domain/usecases/get_company_address.dart'
    as _i14;
import 'package:invoice_app/src/core/domain/usecases/get_company_name.dart'
    as _i15;
import 'package:invoice_app/src/core/domain/usecases/save_bank_info.dart'
    as _i16;
import 'package:invoice_app/src/core/domain/usecases/save_company_address.dart'
    as _i17;
import 'package:invoice_app/src/core/domain/usecases/save_company_name.dart'
    as _i18;
import 'package:invoice_app/src/features/add_invoice/presentation/add_invoice_viewmodel.dart'
    as _i3;
import 'package:invoice_app/src/features/generate_pdf/data/repositories/pdf_template_repo.dart'
    as _i8;
import 'package:invoice_app/src/features/generate_pdf/domain/usecases/generate_invoice.dart'
    as _i12;
import 'package:invoice_app/src/features/settings/presentation/bank/bank_info_viewmodel.dart'
    as _i4;
import 'package:invoice_app/src/features/settings/presentation/basic/basic_info_viewmodel.dart'
    as _i5;
import 'package:invoice_app/src/features/settings/presentation/client/client_info_viewmodel.dart'
    as _i6;
import 'package:invoice_app/src/features/settings/presentation/service/service_info_viewmodel.dart'
    as _i9;
import 'package:invoice_app/src/features/settings/presentation/settings_viewmodel.dart'
    as _i19;

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
    gh.factory<_i4.BankInfoViewModel>(() => _i4.BankInfoViewModel());
    gh.factory<_i5.BasicInfoViewModel>(() => _i5.BasicInfoViewModel());
    gh.factory<_i6.ClientInfoViewModel>(() => _i6.ClientInfoViewModel());
    gh.singleton<_i7.ILocalDataSource>(_i7.LocalDataSource());
    gh.factory<_i8.IPdfTemplateRepo>(() => _i8.PdfTemplateRepo());
    gh.factory<_i9.ServiceInfoViewModel>(() => _i9.ServiceInfoViewModel());
    gh.singleton<_i10.IBankRepository>(
        _i10.BankRepository(gh<_i7.ILocalDataSource>()));
    gh.singleton<_i11.ICompanyRepository>(
        _i11.CompanyRepository(gh<_i7.ILocalDataSource>()));
    gh.factory<_i12.IGenerateInvoiceUseCase>(
        () => _i12.GenerateInvoiceUseCase(gh<_i8.IPdfTemplateRepo>()));
    gh.factory<_i13.IGetBankInfo>(
        () => _i13.GetBankInfo(gh<_i10.IBankRepository>()));
    gh.factory<_i14.IGetCompanyAddress>(
        () => _i14.GetCompanyAddress(gh<_i11.ICompanyRepository>()));
    gh.factory<_i15.IGetCompanyName>(
        () => _i15.GetCompanyName(gh<_i11.ICompanyRepository>()));
    gh.factory<_i16.ISaveBankInfo>(
        () => _i16.SaveBankInfo(gh<_i10.IBankRepository>()));
    gh.factory<_i17.ISaveCompanyAddress>(
        () => _i17.SaveCompanyAddress(gh<_i11.ICompanyRepository>()));
    gh.factory<_i18.ISaveCompanyName>(
        () => _i18.SaveCompanyName(gh<_i11.ICompanyRepository>()));
    gh.factory<_i19.SettingsViewModel>(() => _i19.SettingsViewModel(
          gh<_i15.IGetCompanyName>(),
          gh<_i14.IGetCompanyAddress>(),
          gh<_i13.IGetBankInfo>(),
          gh<_i18.ISaveCompanyName>(),
          gh<_i17.ISaveCompanyAddress>(),
          gh<_i16.ISaveBankInfo>(),
        ));
    return this;
  }
}
