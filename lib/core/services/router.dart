// coverage:ignore-file
part of 'router.imports.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  return _appRoute(settings);
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (_, __, ___) => page,
    transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
  );
}

// PageRouteBuilder<dynamic> _ownerRoute(RouteSettings settings) {
//   switch (settings.name) {
//     case OTPVerificationScreen.id:
//       return _pageBuilder(
//         BlocProvider<AuthBLoC>(
//           create: (_) => sl<AuthBLoC>(),
//           child: const OTPVerificationScreen(),
//         ),
//         settings: settings,
//       );
//     case owner.DashBoard.id:
//       return _pageBuilder(
//         MultiBlocProvider(
//           providers: [
//             BlocProvider<DailyProgressCubit>(
//               create: (_) => DailyProgressCubit(),
//             ),
//             BlocProvider<NotificationCubit>(
//               create: (_) => sl<NotificationCubit>(),
//             ),
//             BlocProvider<BranchesBloc>(
//               create: (_) => sl<BranchesBloc>(),
//             ),
//           ],
//           child: ChangeNotifierProvider(
//             create: (_) => BranchesProvider(),
//             child: owner.DashBoard(owner: settings.arguments! as Owner),
//           ),
//         ),
//         settings: settings,
//       );
//     case BranchScreen.id:
//       return _pageBuilder(
//         BlocProvider<BranchesBloc>(
//           create: (_) => sl<BranchesBloc>(),
//           child: const BranchScreen(),
//         ),
//         settings: settings,
//       );
//     case BranchStaffScreen.id:
//       return _pageBuilder(
//         BlocProvider<StaffBloc>(
//           create: (_) => sl<StaffBloc>(),
//           child: ChangeNotifierProvider(
//             create: (_) => sl<StaffProvider>(),
//             child: BranchStaffScreen(branch: settings.arguments! as Branch),
//           ),
//         ),
//         settings: settings,
//       );
//     case StaffDetailScreen.id:
//       return _pageBuilder(
//         BlocProvider(
//           create: (context) => sl<StaffBloc>(),
//           child: ChangeNotifierProvider(
//             create: (_) => StaffDetailProvider(settings.arguments! as Staff),
//             child: const StaffDetailScreen(),
//           ),
//         ),
//         settings: settings,
//       );
//     case owner_stock.StockScreen.id:
//       final branch = settings.arguments! as Branch;
//       return _pageBuilder(
//         BlocProvider(
//           create: (context) => sl<TankBloc>(),
//           child: owner_stock.StockScreen(branch: branch),
//         ),
//         settings: settings,
//       );
//     case owner_meter.MeterScreen.id:
//       return _pageBuilder(
//         ChangeNotifierProvider(
//           create: (_) => AdminMeterProvider(),
//           child: const owner_meter.MeterScreen(),
//         ),
//         settings: settings,
//       );
//     case VaultScreen.id:
//       return _pageBuilder(
//         const VaultScreen(),
//         settings: settings,
//       );
//     case BranchSettingsScreen.id:
//       return _pageBuilder(
//         BlocProvider<BranchesBloc>(
//           create: (_) => sl<BranchesBloc>(),
//           child: const BranchSettingsScreen(),
//         ),
//         settings: settings,
//       );
//     case NotificationsSettingsScreen.id:
//       return _pageBuilder(
//         BlocProvider<NotificationSettingsCubit>(
//           create: (_) => sl<NotificationSettingsCubit>(),
//           child: const NotificationsSettingsScreen(),
//         ),
//         settings: settings,
//       );
//     case AddStaffScreen.id:
//       return _pageBuilder(
//         BlocProvider(
//           create: (context) => sl<StaffBloc>(),
//           child: ChangeNotifierProvider(
//             create: (_) => DropDownTextFieldController(),
//             child: const AddStaffScreen(),
//           ),
//         ),
//         settings: settings,
//       );
//     case TanksScreen.id:
//       final branch = settings.arguments! as Branch;
//       return _pageBuilder(
//         BlocProvider(
//           create: (context) => sl<TankBloc>(),
//           child: TanksScreen(branch: branch),
//         ),
//         settings: settings,
//       );
//     case owner_expense.ExpenseScreen.id:
//       return _pageBuilder(
//         const owner_expense.ExpenseScreen(),
//         settings: settings,
//       );
//     case PumpsScreen.id:
//       final branch = settings.arguments! as Branch;
//       return _pageBuilder(
//         MultiBlocProvider(
//           providers: [
//             BlocProvider<TankBloc>(
//               create: (_) => sl<TankBloc>(),
//             ),
//             BlocProvider<MeterBloc>(
//               create: (_) => sl<MeterBloc>(),
//             ),
//           ],
//           child: MultiProvider(
//             providers: [
//               ChangeNotifierProvider(create: (_) => PumpProvider()),
//               ChangeNotifierProvider(create: (_) => PumpMeterProvider()),
//             ],
//             child: PumpsScreen(branch: branch),
//           ),
//         ),
//         settings: settings,
//       );
//     default:
//       return _pageBuilder(
//         Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//             foregroundColor: Colors.black,
//           ),
//           body: Center(
//             child: Text(
//               'Nothing to see here.\n${settings.name} '
//               "doesn't exist yet",
//             ),
//           ),
//         ),
//         settings: settings,
//       );
//   }
// }

PageRouteBuilder<dynamic> _appRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.id:
      return _pageBuilder(
        const SplashScreen(),
        settings: settings,
      );

    case SignInPage.id:
      return _pageBuilder(
        const SignInPage(),
        settings: settings,
      );

    case HomePage.id:
      return _pageBuilder(
        const HomePage(),
        settings: settings,
      );
    default:
      return _appRoute(settings);
  }
}
//     // case WelcomeScreen.id:
//     //   return _pageBuilder(
//     //     const WelcomeScreen(),
//     //     settings: settings,
//     //   );
//     case SignInScreen.id:
//       return _pageBuilder(
//         BlocProvider<AuthBLoC>(
//           create: (_) => sl<AuthBLoC>(),
//           child: const SignInScreen(),
//         ),
//         settings: settings,
//       );
//     case ForgotPasswordScreen.id:
//       return _pageBuilder(
//         const ForgotPasswordScreen(),
//         settings: settings,
//       );
//     case ResetPasswordScreen.id:
//       return _pageBuilder(
//         BlocProvider<AuthBLoC>(
//           create: (_) => sl<AuthBLoC>(),
//           child: ResetPasswordScreen(email: settings.arguments! as String),
//         ),
//         settings: settings,
//       );
//     case SignUpScreen.id:
//       return _pageBuilder(
//         BlocProvider<AuthBLoC>(
//           create: (_) => sl<AuthBLoC>(),
//           child: const SignUpScreen(),
//         ),
//         settings: settings,
//       );
//     case DashBoard.id:
//       return _pageBuilder(
//         BlocProvider<DailyProgressCubit>(
//           create: (context) => DailyProgressCubit(),
//           child: const DashBoard(),
//         ),
//         settings: settings,
//       );
//     case MeterScreen.id:
//       return _pageBuilder(
//         ChangeNotifierProvider(
//           create: (_) => MeterProvider(),
//           child: const MeterScreen(),
//         ),
//         settings: settings,
//       );
//     case CreditorsEntryScreen.id:
//       return _pageBuilder(
//         const CreditorsEntryScreen(),
//         settings: settings,
//       );
//     case AddCreditorScreen.id:
//       return _pageBuilder(
//         ChangeNotifierProvider(
//           create: (_) => CreditorProvider(),
//           child: const AddCreditorScreen(),
//         ),
//         settings: settings,
//       );
//     case ClearCreditorScreen.id:
//       return _pageBuilder(
//         ChangeNotifierProvider(
//           create: (_) => CreditorProvider(),
//           child: const ClearCreditorScreen(),
//         ),
//         settings: settings,
//       );
//     case CreditorsScreen.id:
//       final arguments = settings.arguments! as DataMap;
//       final isOwner = arguments['isOwner'] as bool? ?? false;
//       final branch = arguments['branch'] as Branch?;
//       return _pageBuilder(
//         BlocProvider(
//           create: (context) => sl<CreditorBloc>(),
//           child: CreditorsScreen(branch: branch, isOwner: isOwner),
//         ),
//         settings: settings,
//       );
//     case CreditorDetailsScreen.id:
//       return _pageBuilder(
//         const CreditorDetailsScreen(),
//         settings: settings,
//       );
//     case StockScreen.id:
//       return _pageBuilder(
//         ChangeNotifierProvider(
//           create: (_) => StockProvider(),
//           child: const StockScreen(),
//         ),
//         settings: settings,
//       );
//     case ExpenseScreen.id:
//       return _pageBuilder(
//         ChangeNotifierProvider(
//           create: (_) => ExpenseProvider(),
//           child: const ExpenseScreen(),
//         ),
//         settings: settings,
//       );
//     case RevenueScreen.id:
//       return _pageBuilder(
//         ChangeNotifierProvider(
//           create: (_) => RevenueProvider(),
//           child: const RevenueScreen(),
//         ),
//         settings: settings,
//       );
//     default:
//       return _ownerRoute(settings);
//   }
// }
