import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:petly/app/shell/app_shell.dart';
import 'package:petly/features/appointments/presentation/appointment_form_screen.dart';
import 'package:petly/features/memories/presentation/memories_screen.dart';
import 'package:petly/features/pets/presentation/pet_id_card_screen.dart';
import 'package:petly/features/appointments/presentation/appointments_screen.dart';
import 'package:petly/features/dashboard/presentation/dashboard_screen.dart';
import 'package:petly/features/emergency/presentation/emergency_dashboard_screen.dart';
import 'package:petly/features/expenses/presentation/expense_form_screen.dart';
import 'package:petly/features/expenses/presentation/expenses_screen.dart';
import 'package:petly/features/growth/presentation/growth_form_screen.dart';
import 'package:petly/features/food/presentation/food_screen.dart';
import 'package:petly/features/grooming/presentation/grooming_screen.dart';
import 'package:petly/features/growth/presentation/growth_screen.dart';
import 'package:petly/features/medical_history/presentation/medical_history_screen.dart';
import 'package:petly/features/medical_history/presentation/medical_record_form_screen.dart';
import 'package:petly/features/breeding/presentation/breeding_records_screen.dart';
import 'package:petly/features/breeding/presentation/breeding_record_form_screen.dart';
import 'package:petly/features/onboarding/presentation/bootstrap_screen.dart';
import 'package:petly/features/onboarding/presentation/onboarding_screen.dart';
import 'package:petly/features/pets/presentation/pet_details_screen.dart';
import 'package:petly/features/pets/presentation/pet_form_screen.dart';
import 'package:petly/features/pets/presentation/pets_screen.dart';
import 'package:petly/features/shared/presentation/calendar_screen.dart';
import 'package:petly/features/shared/presentation/records_screen.dart';
import 'package:petly/features/shared/presentation/settings_screen.dart';
import 'package:petly/features/vaccinations/presentation/vaccination_form_screen.dart';
import 'package:petly/features/vaccinations/presentation/vaccinations_screen.dart';
import 'package:petly/features/dewormings/presentation/dewormings_screen.dart';
import 'package:petly/features/dewormings/presentation/deworming_form_screen.dart';
import 'package:petly/features/medicines/presentation/medicines_screen.dart';
import 'package:petly/features/medicines/presentation/medicine_form_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'rootNavigator');

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/',
    routes: [
      // Bootstrap / splash
      GoRoute(path: '/', builder: (ctx, s) => const BootstrapScreen()),
      GoRoute(
          path: '/onboarding',
          builder: (ctx, s) => const OnboardingScreen()),

      // Main shell with bottom nav
      StatefulShellRoute.indexedStack(
        builder: (ctx, s, shell) => AppShell(navigationShell: shell),
        branches: [
          // 1 — Home
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/home',
              builder: (ctx, s) => const DashboardScreen(),
            ),
          ]),

          // 2 — Pets + all sub-screens
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/pets',
              builder: (ctx, s) => const PetsScreen(),
              routes: [
                GoRoute(
                  path: 'new',
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (ctx, s) => const PetFormScreen(),
                ),
                GoRoute(
                  path: ':petId',
                  parentNavigatorKey: rootNavigatorKey,
                  builder: (ctx, s) =>
                      PetDetailsScreen(petId: s.pathParameters['petId']!),
                  routes: [
                    GoRoute(
                      path: 'edit',
                      parentNavigatorKey: rootNavigatorKey,
                      builder: (ctx, s) => PetFormScreen(
                          petId: s.pathParameters['petId']),
                    ),

                    // Vaccinations
                    GoRoute(
                      path: 'vaccinations',
                      parentNavigatorKey: rootNavigatorKey,
                      builder: (ctx, s) => VaccinationsScreen(
                          petId: s.pathParameters['petId']!),
                      routes: [
                        GoRoute(
                          path: 'new',
                          parentNavigatorKey: rootNavigatorKey,
                          builder: (ctx, s) => VaccinationFormScreen(
                              petId: s.pathParameters['petId']!),
                        ),
                        GoRoute(
                          path: ':vacId',
                          parentNavigatorKey: rootNavigatorKey,
                          builder: (ctx, s) => VaccinationFormScreen(
                            petId: s.pathParameters['petId']!,
                            vaccinationId: s.pathParameters['vacId'],
                          ),
                        ),
                      ],
                    ),

                    // Dewormings
                    GoRoute(
                      path: 'dewormings',
                      parentNavigatorKey: rootNavigatorKey,
                      builder: (ctx, s) => DewormingsScreen(
                          petId: s.pathParameters['petId']!),
                      routes: [
                        GoRoute(
                          path: 'new',
                          parentNavigatorKey: rootNavigatorKey,
                          builder: (ctx, s) => DewormingFormScreen(
                              petId: s.pathParameters['petId']!),
                        ),
                      ],
                    ),

                    // Medical history
                    GoRoute(
                      path: 'medical',
                      parentNavigatorKey: rootNavigatorKey,
                      builder: (ctx, s) => MedicalHistoryScreen(
                          petId: s.pathParameters['petId']!),
                      routes: [
                        GoRoute(
                          path: 'new',
                          parentNavigatorKey: rootNavigatorKey,
                          builder: (ctx, s) => MedicalRecordFormScreen(
                              petId: s.pathParameters['petId']!),
                        ),
                        GoRoute(
                          path: ':recordId',
                          parentNavigatorKey: rootNavigatorKey,
                          builder: (ctx, s) => MedicalRecordFormScreen(
                            petId: s.pathParameters['petId']!,
                            recordId: s.pathParameters['recordId'],
                          ),
                        ),
                      ],
                    ),

                        // Breeding records
                    GoRoute(
                      path: 'breeding',
                      parentNavigatorKey: rootNavigatorKey,
                      builder: (ctx, s) => BreedingRecordsScreen(
                          petId: s.pathParameters['petId']!),
                      routes: [
                        GoRoute(
                          path: 'new',
                          parentNavigatorKey: rootNavigatorKey,
                          builder: (ctx, s) => BreedingRecordFormScreen(
                              petId: s.pathParameters['petId']!),
                        ),
                        GoRoute(
                          path: ':recordId',
                          parentNavigatorKey: rootNavigatorKey,
                          builder: (ctx, s) => BreedingRecordFormScreen(
                            petId: s.pathParameters['petId']!,
                            recordId: s.pathParameters['recordId'],
                          ),
                        ),
                      ],
                    ),

                    // ID Card
                        GoRoute(
                          path: 'id',
                          parentNavigatorKey: rootNavigatorKey,
                          builder: (ctx, s) => PetIdCardScreen(
                            petId: s.pathParameters['petId']!,
                          ),
                        ),
                        
                        // Emergency & Vets
                        GoRoute(
                          path: 'emergency',
                          parentNavigatorKey: rootNavigatorKey,
                          builder: (ctx, s) => EmergencyDashboardScreen(
                            petId: s.pathParameters['petId']!,
                          ),
                        ),
                        
                        // Diet & Food
                        GoRoute(
                          path: 'food',
                          parentNavigatorKey: rootNavigatorKey,
                          builder: (ctx, s) => FoodScreen(
                            petId: s.pathParameters['petId']!,
                          ),
                        ),

                        // Grooming
                        GoRoute(
                          path: 'grooming',
                          parentNavigatorKey: rootNavigatorKey,
                          builder: (ctx, s) => GroomingScreen(
                            petId: s.pathParameters['petId']!,
                          ),
                        ),

                        // Appointments
                    GoRoute(
                      path: 'appointments',
                      parentNavigatorKey: rootNavigatorKey,
                      builder: (ctx, s) => AppointmentsScreen(
                          petId: s.pathParameters['petId']!),
                      routes: [
                        GoRoute(
                          path: 'new',
                          parentNavigatorKey: rootNavigatorKey,
                          builder: (ctx, s) => AppointmentFormScreen(
                              petId: s.pathParameters['petId']!),
                        ),
                        GoRoute(
                          path: ':apptId',
                          parentNavigatorKey: rootNavigatorKey,
                          builder: (ctx, s) => AppointmentFormScreen(
                            petId: s.pathParameters['petId']!,
                            appointmentId: s.pathParameters['apptId'],
                          ),
                        ),
                      ],
                    ),

                    // Growth
                    GoRoute(
                      path: 'growth',
                      parentNavigatorKey: rootNavigatorKey,
                      builder: (ctx, s) =>
                          GrowthScreen(petId: s.pathParameters['petId']!),
                      routes: [
                        GoRoute(
                          path: 'new',
                          parentNavigatorKey: rootNavigatorKey,
                          builder: (ctx, s) => GrowthFormScreen(
                              petId: s.pathParameters['petId']!),
                        ),
                        GoRoute(
                          path: ':entryId/edit',
                          parentNavigatorKey: rootNavigatorKey,
                          builder: (ctx, s) => GrowthFormScreen(
                            petId: s.pathParameters['petId']!,
                            entryId: s.pathParameters['entryId'],
                          ),
                        ),
                      ],
                    ),

                      // Expenses
                    GoRoute(
                      path: 'expenses',
                      parentNavigatorKey: rootNavigatorKey,
                      builder: (ctx, s) =>
                          ExpensesScreen(petId: s.pathParameters['petId']!),
                      routes: [
                        GoRoute(
                          path: 'new',
                          parentNavigatorKey: rootNavigatorKey,
                          builder: (ctx, s) => ExpenseFormScreen(
                              petId: s.pathParameters['petId']!),
                        ),
                        GoRoute(
                          path: ':expId',
                          parentNavigatorKey: rootNavigatorKey,
                          builder: (ctx, s) => ExpenseFormScreen(
                            petId: s.pathParameters['petId']!,
                            expenseId: s.pathParameters['expId'],
                          ),
                        ),
                      ],
                    ),
                    
                    // Medicines
                    GoRoute(
                      path: 'medicines',
                      parentNavigatorKey: rootNavigatorKey,
                      builder: (ctx, s) =>
                          MedicinesScreen(petId: s.pathParameters['petId']!),
                      routes: [
                        GoRoute(
                          path: 'new',
                          parentNavigatorKey: rootNavigatorKey,
                          builder: (ctx, s) => MedicineFormScreen(
                              petId: s.pathParameters['petId']!),
                        ),
                      ],
                    ),
                    
                    // Memories
                    GoRoute(
                      path: 'memories',
                      parentNavigatorKey: rootNavigatorKey,
                      builder: (ctx, s) =>
                          MemoriesScreen(petId: s.pathParameters['petId']!),
                    ),
                  ],
                ),
              ],
            ),
          ]),

          // 3 — Calendar
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/calendar',
              builder: (ctx, s) => const CalendarScreen(),
            ),
          ]),

          // 4 — Records
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/records',
              builder: (ctx, s) => const RecordsScreen(),
            ),
          ]),

          // 5 — Settings
          StatefulShellBranch(routes: [
            GoRoute(
              path: '/settings',
              builder: (ctx, s) => const SettingsScreen(),
            ),
          ]),
        ],
      ),
    ],
  );
});
