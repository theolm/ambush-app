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
    as _i8;
import 'package:invoice_app/src/core/data/repositories/company_repository.dart'
    as _i9;
import 'package:invoice_app/src/core/domain/usecases/get_bank_info.dart'
    as _i11;
import 'package:invoice_app/src/core/domain/usecases/get_company_address.dart'
    as _i12;
import 'package:invoice_app/src/core/domain/usecases/get_company_name.dart'
    as _i13;
import 'package:invoice_app/src/core/domain/usecases/save_bank_info.dart'
    as _i14;
import 'package:invoice_app/src/core/domain/usecases/save_company_address.dart'
    as _i15;
import 'package:invoice_app/src/core/domain/usecases/save_company_name.dart'
    as _i16;
import 'package:invoice_app/src/features/add_invoice/presentation/add_invoice_viewmodel.dart'
    as _i3;
import 'package:invoice_app/src/features/generate_pdf/data/repositories/pdf_template_repo.dart'
    as _i6;
import 'package:invoice_app/src/features/generate_pdf/domain/usecases/generate_invoice.dart'
    as _i10;
import 'package:invoice_app/src/features/settings/presentation/bank/bank_info_viewmodel.dart'
    as _i17;
import 'package:invoice_app/src/features/settings/presentation/basic/basic_info_viewmodel.dart'
    as _i18;
import 'package:invoice_app/src/features/settings/presentation/client/client_info_viewmodel.dart'
    as _i4;
import 'package:invoice_app/src/features/settings/presentation/service/service_info_viewmodel.dart'
    as _i7;

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
    gh.factory<_i4.ClientInfoViewModel>(() => _i4.ClientInfoViewModel());
    gh.singleton<_i5.ILocalDataSource>(_i5.LocalDataSource());
    gh.factory<_i6.IPdfTemplateRepo>(() => _i6.PdfTemplateRepo());
    gh.factory<_i7.ServiceInfoViewModel>(() => _i7.ServiceInfoViewModel());
    gh.singleton<_i8.IBankRepository>(
        _i8.BankRepository(gh<_i5.ILocalDataSource>()));
    gh.singleton<_i9.ICompanyRepository>(
        _i9.CompanyRepository(gh<_i5.ILocalDataSource>()));
    gh.factory<_i10.IGenerateInvoiceUseCase>(
        () => _i10.GenerateInvoiceUseCase(gh<_i6.IPdfTemplateRepo>()));
    gh.factory<_i11.IGetBankInfo>(
        () => _i11.GetBankInfo(gh<_i8.IBankRepository>()));
    gh.factory<_i12.IGetCompanyAddress>(
        () => _i12.GetCompanyAddress(gh<_i9.ICompanyRepository>()));
    gh.factory<_i13.IGetCompanyName>(
        () => _i13.GetCompanyName(gh<_i9.ICompanyRepository>()));
    gh.factory<_i14.ISaveBankInfo>(
        () => _i14.SaveBankInfo(gh<_i8.IBankRepository>()));
    gh.factory<_i15.ISaveCompanyAddress>(
        () => _i15.SaveCompanyAddress(gh<_i9.ICompanyRepository>()));
    gh.factory<_i16.ISaveCompanyName>(
        () => _i16.SaveCompanyName(gh<_i9.ICompanyRepository>()));
    gh.factory<_i17.BankInfoViewModel>(() => _i17.BankInfoViewModel(
          gh<_i11.IGetBankInfo>(),
          gh<_i14.ISaveBankInfo>(),
        ));
    gh.factory<_i18.BasicInfoViewModel>(() => _i18.BasicInfoViewModel(
          gh<_i13.IGetCompanyName>(),
          gh<_i12.IGetCompanyAddress>(),
          gh<_i16.ISaveCompanyName>(),
          gh<_i15.ISaveCompanyAddress>(),
        ));
    return this;
  }
}
