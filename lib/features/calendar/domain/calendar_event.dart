import 'package:flutter/material.dart';

enum CalendarEventType {
  appointment,
  medication,
  vaccination,
  deworming,
}

class CalendarEvent {
  const CalendarEvent({
    required this.id,
    required this.title,
    required this.date,
    required this.type,
    this.subtitle,
    this.petId,
    this.color,
    this.icon,
  });

  final String id;
  final String title;
  final DateTime date;
  final CalendarEventType type;
  final String? subtitle;
  final String? petId;
  final Color? color;
  final IconData? icon;
}
