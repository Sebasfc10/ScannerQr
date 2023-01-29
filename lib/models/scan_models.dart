import 'dart:convert';

import 'package:flutter/material.dart';

class ScanModels {
  ScanModels({
    this.id,
    this.tipo,
    required this.valor,
  }) {
    if (valor.contains('http')) {
      tipo = 'http';
    } else {
      tipo = 'geo';
    }
  }
  int? id;
  String? tipo;
  String valor;

  factory ScanModels.fromJson(Map<String, dynamic> json) => ScanModels(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
      };
}
