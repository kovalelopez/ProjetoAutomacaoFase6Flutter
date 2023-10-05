import 'package:fase_6/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';

import '../lib/main.dart' as app;
import 'json.dart';


void main() {
  
final List<TestResult> results = [];

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  tearDown(() async {
    GetIt.I.reset();
    return await Future.delayed(const Duration(seconds: 2));
  });
  tearDownAll(() => enviarDadosComoJson(results));
    group('end-to-end test', () {
    
    testWidgets('Validação do botão Settings',
     (tester) async {
         results.add(TestResult(title: 'Validação do botão Settings', aproved: false));
     app.main();
     await tester.pumpAndSettle();   

     expect(find.byKey(const ValueKey('btnSettings')), findsOneWidget);
     await tester.tap(find.byIcon(Icons.settings));
     await Future.delayed(Duration(seconds: 3));
   results.last.aproved = true;
     });

    testWidgets('Validação do título da tela Preferencias do usuário',
     (tester) async {
         results.add(TestResult(title: 'Validação do título da tela Preferencias do usuário', aproved: false));
     app.main();
     await tester.pumpAndSettle();

     expect(find.byKey(const ValueKey('btnSettings')), findsOneWidget);
     await tester.tap(find.byIcon(Icons.settings));
     await Future.delayed(Duration(seconds: 2));
     expect(find.byKey(ValueKey('userSettings')), findsOneWidget);
     expect(find.text('Preferencias do usuário'), findsOneWidget);
     
   results.last.aproved = true;   
      });

      testWidgets('Validação do texto na tela',
     (tester) async {
         results.add(TestResult(title: 'Validação do texto na tela', aproved: false));
     app.main();
     await tester.pumpAndSettle();

     expect(find.byKey(const ValueKey('btnSettings')), findsOneWidget);
     await tester.tap(find.byIcon(Icons.settings));
     await Future.delayed(Duration(seconds: 2));
     expect(find.text('Aparência'), findsOneWidget);

   results.last.aproved = true;
     });

     testWidgets('Validação do botão Voltar',
     (tester) async {
         results.add(TestResult(title: 'Validação do botão Voltar', aproved: false));
     app.main();
     await tester.pumpAndSettle();
     
     expect(find.byKey(const ValueKey('btnSettings')), findsOneWidget);
     await tester.tap(find.byIcon(Icons.settings));
     await Future.delayed(Duration(seconds: 2));
     expect(find.byKey(ValueKey('userSettings')), findsOneWidget);
     final backButton = find.byTooltip('Back');
     await tester.tap(backButton);
     await tester.pumpAndSettle();
     await Future.delayed(Duration(seconds: 2));

   results.last.aproved = true;
     });

     testWidgets('Validação do dropDownButton',
     (tester) async {
         results.add(TestResult(title: 'Validação do dropDownButton', aproved: false));
     app.main();
     await tester.pumpAndSettle();
     
     expect(find.byKey(const ValueKey('btnSettings')), findsOneWidget);
     await tester.tap(find.byIcon(Icons.settings));
     await Future.delayed(Duration(seconds: 2));
     expect(find.byKey(ValueKey('userThemeSelector')), findsOneWidget);
     await tester.tap(find.byKey(ValueKey('userThemeSelector')));
     await Future.delayed(Duration(seconds: 2));

   results.last.aproved = true;
     });

      testWidgets('Validação do tema Escuro da Aparência',
     (tester) async {
         results.add(TestResult(title: 'Validação dos temas da Aparência', aproved: false));
     app.main();
     await tester.pumpAndSettle();
     
     expect(find.byKey(const ValueKey('btnSettings')), findsOneWidget);
     await tester.tap(find.byIcon(Icons.settings));
     await Future.delayed(Duration(seconds: 2));
     expect(find.byKey(ValueKey('userThemeSelector')), findsOneWidget);
     await tester.tap(find.byKey(ValueKey('userThemeSelector')));
     await Future.delayed(Duration(seconds: 2));
     await tester.tap(find.text('Escuro'));
     await Future.delayed(Duration(seconds: 2));
   results.last.aproved = true;  
     });

     testWidgets('Validação do tema Claro da Aparência',
     (tester) async {
         results.add(TestResult(title: 'Validação dos temas da Aparência', aproved: false));
     app.main();
     await tester.pumpAndSettle();
     
     expect(find.byKey(const ValueKey('btnSettings')), findsOneWidget);
     await tester.tap(find.byIcon(Icons.settings));
     await Future.delayed(Duration(seconds: 2));
     expect(find.byKey(ValueKey('userThemeSelector')), findsOneWidget);
     await tester.tap(find.byKey(ValueKey('userThemeSelector')));
     await Future.delayed(Duration(seconds: 2));
     await tester.tap(find.text('Claro'));
     await Future.delayed(Duration(seconds: 2));
   results.last.aproved = true;
    });  

     testWidgets('Validação do tema Sistema da Aparência',
     (tester) async {
         results.add(TestResult(title: 'Validação dos temas da Aparência', aproved: false));
     app.main();
     await tester.pumpAndSettle();
     
     expect(find.byKey(const ValueKey('btnSettings')), findsOneWidget);
     await tester.tap(find.byIcon(Icons.settings));
     await Future.delayed(Duration(seconds: 2));
     expect(find.byKey(ValueKey('userThemeSelector')), findsOneWidget);
     await tester.tap(find.byKey(ValueKey('userThemeSelector')));
     await Future.delayed(Duration(seconds: 2));
     await tester.tap(find.text('Escuro'));
     await Future.delayed(Duration(seconds: 2));
     expect(find.byKey(ValueKey('userThemeSelector')), findsOneWidget); 
     await tester.tap(find.byKey(ValueKey('userThemeSelector')));
     await Future.delayed(Duration(seconds: 2));
     expect(find.byKey(ValueKey('systemTheme')), findsOneWidget);
     await tester.tap(find.byKey(ValueKey('systemTheme')));
     await Future.delayed(Duration(seconds: 2));
   results.last.aproved = true;
     }); 

  test('Validacao copywith do AppColor', () {
      final AppColors initialColor = AppColors(primaryColor: Colors.white, combineWithPrimaryColor: Colors.black);
      final AppColors updatedColor = initialColor.copyWith();
     
      expect(initialColor, isNot(equals(updatedColor)));
    });

});

}