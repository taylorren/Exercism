import 'dart:collection';

class RelativeDistance {
  late Map<String, List<String>> _graph;

  RelativeDistance(Map<String, List<String>> familyTree) {
    _buildGraph(familyTree);
  }

  void _buildGraph(Map<String, List<String>> familyTree) {
    _graph = {};

    // Add parent-child and child-parent edges
    for (var entry in familyTree.entries) {
      String parent = entry.key;
      List<String> children = entry.value;

      for (String child in children) {
        _graph.putIfAbsent(parent, () => []).add(child);
        _graph.putIfAbsent(child, () => []).add(parent);
      }

      // Add sibling edges
      for (int i = 0; i < children.length; i++) {
        for (int j = i + 1; j < children.length; j++) {
          _graph.putIfAbsent(children[i], () => []).add(children[j]);
          _graph.putIfAbsent(children[j], () => []).add(children[i]);
        }
      }
    }
  }

  int degreesOfSeparation(String a, String b) {
    if (a == b) return 0;

    Set<String> visited = {};
    Queue<String> queue = Queue();
    Map<String, int> distance = {};

    queue.add(a);
    visited.add(a);
    distance[a] = 0;

    while (queue.isNotEmpty) {
      String current = queue.removeFirst();
      List<String> neighbors = _graph[current] ?? [];

      for (String neighbor in neighbors) {
        if (!visited.contains(neighbor)) {
          visited.add(neighbor);
          distance[neighbor] = distance[current]! + 1;
          if (neighbor == b) {
            return distance[neighbor]!;
          }
          queue.add(neighbor);
        }
      }
    }

    return -1;
  }
}
