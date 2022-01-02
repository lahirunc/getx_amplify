/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, file_names, unnecessary_new, prefer_if_null_operators, prefer_const_constructors, slash_for_doc_comments, annotate_overrides, non_constant_identifier_names, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, unnecessary_const, dead_code

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Todos type in your schema. */
@immutable
class Todos extends Model {
  static const classType = const _TodosModelType();
  final String id;
  final String? _task;
  final bool? _isDone;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get task {
    try {
      return _task!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  bool get isDone {
    try {
      return _isDone!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  const Todos._internal({required this.id, required task, required isDone}): _task = task, _isDone = isDone;
  
  factory Todos({String? id, required String task, required bool isDone}) {
    return Todos._internal(
      id: id == null ? UUID.getUUID() : id,
      task: task,
      isDone: isDone);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Todos &&
      id == other.id &&
      _task == other._task &&
      _isDone == other._isDone;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Todos {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("task=" + "$_task" + ", ");
    buffer.write("isDone=" + (_isDone != null ? _isDone!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Todos copyWith({String? id, String? task, bool? isDone}) {
    return Todos(
      id: id ?? this.id,
      task: task ?? this.task,
      isDone: isDone ?? this.isDone);
  }
  
  Todos.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _task = json['task'],
      _isDone = json['isDone'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'task': _task, 'isDone': _isDone
  };

  static final QueryField ID = QueryField(fieldName: "todos.id");
  static final QueryField TASK = QueryField(fieldName: "task");
  static final QueryField ISDONE = QueryField(fieldName: "isDone");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Todos";
    modelSchemaDefinition.pluralName = "Todos";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todos.TASK,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Todos.ISDONE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
  });
}

class _TodosModelType extends ModelType<Todos> {
  const _TodosModelType();
  
  @override
  Todos fromJson(Map<String, dynamic> jsonData) {
    return Todos.fromJson(jsonData);
  }
}