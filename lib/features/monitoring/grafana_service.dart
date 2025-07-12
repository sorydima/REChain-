import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

/// Grafana Service for dashboard management and visualization
class GrafanaService {
  final String _baseUrl;
  final String _apiKey;
  final http.Client _client;

  GrafanaService({
    required String baseUrl,
    required String apiKey,
    http.Client? client,
  })  : _baseUrl = baseUrl,
        _apiKey = apiKey,
        _client = client ?? http.Client();

  /// Get all dashboards
  Future<List<GrafanaDashboard>> getDashboards() async {
    try {
      final uri = Uri.parse('$_baseUrl/api/search');
      
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      };

      final response = await _client.get(uri, headers: headers);
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => GrafanaDashboard.fromJson(json)).toList();
      } else {
        throw Exception('Failed to get dashboards: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching dashboards: $e');
    }
  }

  /// Get dashboard by UID
  Future<GrafanaDashboardDetail> getDashboard(String uid) async {
    try {
      final uri = Uri.parse('$_baseUrl/api/dashboards/uid/$uid');
      
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      };

      final response = await _client.get(uri, headers: headers);
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return GrafanaDashboardDetail.fromJson(data);
      } else {
        throw Exception('Failed to get dashboard: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching dashboard: $e');
    }
  }

  /// Create new dashboard
  Future<GrafanaDashboardDetail> createDashboard({
    required String title,
    required String description,
    required List<GrafanaPanel> panels,
    Map<String, dynamic>? tags,
  }) async {
    try {
      final dashboard = {
        'dashboard': {
          'title': title,
          'description': description,
          'tags': tags?.values.toList() ?? [],
          'panels': panels.map((panel) => panel.toJson()).toList(),
          'time': {
            'from': 'now-6h',
            'to': 'now',
          },
          'refresh': '5s',
        },
        'folderId': 0,
        'overwrite': false,
      };

      final uri = Uri.parse('$_baseUrl/api/dashboards/db');
      
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      };

      final response = await _client.post(
        uri,
        headers: headers,
        body: json.encode(dashboard),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return GrafanaDashboardDetail.fromJson(data);
      } else {
        throw Exception('Failed to create dashboard: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error creating dashboard: $e');
    }
  }

  /// Update dashboard
  Future<GrafanaDashboardDetail> updateDashboard({
    required String uid,
    required String title,
    required String description,
    required List<GrafanaPanel> panels,
    Map<String, dynamic>? tags,
  }) async {
    try {
      final existingDashboard = await getDashboard(uid);
      
      final dashboard = {
        'dashboard': {
          'id': existingDashboard.dashboard.id,
          'uid': uid,
          'title': title,
          'description': description,
          'tags': tags?.values.toList() ?? [],
          'panels': panels.map((panel) => panel.toJson()).toList(),
          'time': {
            'from': 'now-6h',
            'to': 'now',
          },
          'refresh': '5s',
          'version': existingDashboard.dashboard.version + 1,
        },
        'folderId': 0,
        'overwrite': true,
      };

      final uri = Uri.parse('$_baseUrl/api/dashboards/db');
      
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      };

      final response = await _client.post(
        uri,
        headers: headers,
        body: json.encode(dashboard),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return GrafanaDashboardDetail.fromJson(data);
      } else {
        throw Exception('Failed to update dashboard: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error updating dashboard: $e');
    }
  }

  /// Delete dashboard
  Future<void> deleteDashboard(String uid) async {
    try {
      final uri = Uri.parse('$_baseUrl/api/dashboards/uid/$uid');
      
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      };

      final response = await _client.delete(uri, headers: headers);
      
      if (response.statusCode != 200) {
        throw Exception('Failed to delete dashboard: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error deleting dashboard: $e');
    }
  }

  /// Get dashboard snapshots
  Future<List<GrafanaSnapshot>> getSnapshots() async {
    try {
      final uri = Uri.parse('$_baseUrl/api/dashboard/snapshots');
      
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      };

      final response = await _client.get(uri, headers: headers);
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => GrafanaSnapshot.fromJson(json)).toList();
      } else {
        throw Exception('Failed to get snapshots: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching snapshots: $e');
    }
  }

  /// Create dashboard snapshot
  Future<GrafanaSnapshot> createSnapshot({
    required String dashboardUid,
    required String name,
    String? description,
    bool isExpires = true,
    Duration? expiresIn,
  }) async {
    try {
      final snapshot = {
        'dashboard': {
          'uid': dashboardUid,
        },
        'name': name,
        'description': description ?? '',
        'expires': isExpires ? (expiresIn?.inSeconds ?? 3600) : 0,
      };

      final uri = Uri.parse('$_baseUrl/api/snapshots');
      
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      };

      final response = await _client.post(
        uri,
        headers: headers,
        body: json.encode(snapshot),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return GrafanaSnapshot.fromJson(data);
      } else {
        throw Exception('Failed to create snapshot: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error creating snapshot: $e');
    }
  }

  /// Get annotations
  Future<List<GrafanaAnnotation>> getAnnotations({
    String? dashboardUid,
    DateTime? from,
    DateTime? to,
  }) async {
    try {
      final queryParams = <String, String>{};
      
      if (dashboardUid != null) {
        queryParams['dashboardUid'] = dashboardUid;
      }
      if (from != null) {
        queryParams['from'] = from.millisecondsSinceEpoch.toString();
      }
      if (to != null) {
        queryParams['to'] = to.millisecondsSinceEpoch.toString();
      }

      final uri = Uri.parse('$_baseUrl/api/annotations').replace(queryParameters: queryParams);
      
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      };

      final response = await _client.get(uri, headers: headers);
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => GrafanaAnnotation.fromJson(json)).toList();
      } else {
        throw Exception('Failed to get annotations: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching annotations: $e');
    }
  }

  /// Create annotation
  Future<GrafanaAnnotation> createAnnotation({
    required String text,
    required DateTime time,
    String? dashboardUid,
    String? panelId,
    Map<String, String>? tags,
  }) async {
    try {
      final annotation = {
        'text': text,
        'time': time.millisecondsSinceEpoch,
        'dashboardUid': dashboardUid,
        'panelId': panelId,
        'tags': tags?.values.toList() ?? [],
      };

      final uri = Uri.parse('$_baseUrl/api/annotations');
      
      final headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      };

      final response = await _client.post(
        uri,
        headers: headers,
        body: json.encode(annotation),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return GrafanaAnnotation.fromJson(data);
      } else {
        throw Exception('Failed to create annotation: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error creating annotation: $e');
    }
  }

  void dispose() {
    _client.close();
  }
}

/// Grafana Dashboard
class GrafanaDashboard {
  final String id;
  final String uid;
  final String title;
  final String url;
  final String type;
  final List<String> tags;
  final bool isStarred;

  GrafanaDashboard({
    required this.id,
    required this.uid,
    required this.title,
    required this.url,
    required this.type,
    required this.tags,
    required this.isStarred,
  });

  factory GrafanaDashboard.fromJson(Map<String, dynamic> json) {
    return GrafanaDashboard(
      id: json['id']?.toString() ?? '',
      uid: json['uid']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      url: json['url']?.toString() ?? '',
      type: json['type']?.toString() ?? '',
      tags: List<String>.from(json['tags'] ?? []),
      isStarred: json['isStarred'] ?? false,
    );
  }
}

/// Grafana Dashboard Detail
class GrafanaDashboardDetail {
  final GrafanaDashboardData dashboard;
  final GrafanaMeta meta;

  GrafanaDashboardDetail({
    required this.dashboard,
    required this.meta,
  });

  factory GrafanaDashboardDetail.fromJson(Map<String, dynamic> json) {
    return GrafanaDashboardDetail(
      dashboard: GrafanaDashboardData.fromJson(json['dashboard'] ?? {}),
      meta: GrafanaMeta.fromJson(json['meta'] ?? {}),
    );
  }
}

/// Grafana Dashboard Data
class GrafanaDashboardData {
  final String id;
  final String uid;
  final String title;
  final String description;
  final List<String> tags;
  final List<GrafanaPanel> panels;
  final int version;

  GrafanaDashboardData({
    required this.id,
    required this.uid,
    required this.title,
    required this.description,
    required this.tags,
    required this.panels,
    required this.version,
  });

  factory GrafanaDashboardData.fromJson(Map<String, dynamic> json) {
    return GrafanaDashboardData(
      id: json['id']?.toString() ?? '',
      uid: json['uid']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      tags: List<String>.from(json['tags'] ?? []),
      panels: (json['panels'] as List<dynamic>? ?? [])
          .map((panel) => GrafanaPanel.fromJson(panel))
          .toList(),
      version: json['version'] ?? 1,
    );
  }
}

/// Grafana Meta
class GrafanaMeta {
  final String type;
  final bool canSave;
  final bool canEdit;
  final bool canAdmin;

  GrafanaMeta({
    required this.type,
    required this.canSave,
    required this.canEdit,
    required this.canAdmin,
  });

  factory GrafanaMeta.fromJson(Map<String, dynamic> json) {
    return GrafanaMeta(
      type: json['type']?.toString() ?? '',
      canSave: json['canSave'] ?? false,
      canEdit: json['canEdit'] ?? false,
      canAdmin: json['canAdmin'] ?? false,
    );
  }
}

/// Grafana Panel
class GrafanaPanel {
  final String id;
  final String title;
  final String type;
  final Map<String, dynamic> targets;
  final Map<String, dynamic> fieldConfig;
  final Map<String, dynamic> gridPos;

  GrafanaPanel({
    required this.id,
    required this.title,
    required this.type,
    required this.targets,
    required this.fieldConfig,
    required this.gridPos,
  });

  factory GrafanaPanel.fromJson(Map<String, dynamic> json) {
    return GrafanaPanel(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      type: json['type']?.toString() ?? '',
      targets: json['targets'] ?? {},
      fieldConfig: json['fieldConfig'] ?? {},
      gridPos: json['gridPos'] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'type': type,
      'targets': targets,
      'fieldConfig': fieldConfig,
      'gridPos': gridPos,
    };
  }
}

/// Grafana Snapshot
class GrafanaSnapshot {
  final String id;
  final String name;
  final String url;
  final DateTime createdAt;
  final DateTime? expiresAt;

  GrafanaSnapshot({
    required this.id,
    required this.name,
    required this.url,
    required this.createdAt,
    this.expiresAt,
  });

  factory GrafanaSnapshot.fromJson(Map<String, dynamic> json) {
    return GrafanaSnapshot(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      url: json['url']?.toString() ?? '',
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      expiresAt: json['expiresAt'] != null 
          ? DateTime.tryParse(json['expiresAt']) 
          : null,
    );
  }
}

/// Grafana Annotation
class GrafanaAnnotation {
  final String id;
  final String text;
  final DateTime time;
  final String? dashboardUid;
  final String? panelId;
  final List<String> tags;

  GrafanaAnnotation({
    required this.id,
    required this.text,
    required this.time,
    this.dashboardUid,
    this.panelId,
    required this.tags,
  });

  factory GrafanaAnnotation.fromJson(Map<String, dynamic> json) {
    return GrafanaAnnotation(
      id: json['id']?.toString() ?? '',
      text: json['text']?.toString() ?? '',
      time: DateTime.tryParse(json['time'] ?? '') ?? DateTime.now(),
      dashboardUid: json['dashboardUid']?.toString(),
      panelId: json['panelId']?.toString(),
      tags: List<String>.from(json['tags'] ?? []),
    );
  }
} 