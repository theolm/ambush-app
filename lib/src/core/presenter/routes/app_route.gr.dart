// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:invoice_app/main.dart' as _i1;
import 'package:invoice_app/src/features/add_invoice/presentation/add_invoice_page.dart'
    as _i3;
import 'package:invoice_app/src/features/settings/presentation/settings_page.dart'
    as _i2;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      final args = routeData.argsAs<SettingsRouteArgs>(
          orElse: () => const SettingsRouteArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.SettingsPage(key: args.key),
      );
    },
    AddInvoiceRoute.name: (routeData) {
      final args = routeData.argsAs<AddInvoiceRouteArgs>(
          orElse: () => const AddInvoiceRouteArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.AddInvoicePage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i4.PageRouteInfo<void> {
  const MainRoute({List<_i4.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SettingsPage]
class SettingsRoute extends _i4.PageRouteInfo<SettingsRouteArgs> {
  SettingsRoute({
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          SettingsRoute.name,
          args: SettingsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i4.PageInfo<SettingsRouteArgs> page =
      _i4.PageInfo<SettingsRouteArgs>(name);
}

class SettingsRouteArgs {
  const SettingsRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'SettingsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.AddInvoicePage]
class AddInvoiceRoute extends _i4.PageRouteInfo<AddInvoiceRouteArgs> {
  AddInvoiceRoute({
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          AddInvoiceRoute.name,
          args: AddInvoiceRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddInvoiceRoute';

  static const _i4.PageInfo<AddInvoiceRouteArgs> page =
      _i4.PageInfo<AddInvoiceRouteArgs>(name);
}

class AddInvoiceRouteArgs {
  const AddInvoiceRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'AddInvoiceRouteArgs{key: $key}';
  }
}
