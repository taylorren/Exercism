class BinarySearchTree {
  Node? root;

  BinarySearchTree(String data) {
    this.root = Node(data);
  }

  void insert(String data) {
    root = _insertAt(root, data);
  }

  Node? _insertAt(Node? node, String data) {
    if (node == null) {
      return Node(data);
    }
    if (data.compareTo(node.data) <= 0) {
      node.left = _insertAt(node.left, data);
    } else {
      node.right = _insertAt(node.right, data);
    }
    return node;
  }

  List<String> get sortedData {
    List<String> result = [];
    _inOrderTraversal(root, result);
    return result;
  }

  void _inOrderTraversal(Node? node, List<String> result) {
    if (node == null) return;
    _inOrderTraversal(node.left, result);
    result.add(node.data);
    _inOrderTraversal(node.right, result);
  }
}

class Node {
  String _data;
  Node? _left;
  Node? _right;

  Node(this._data);

  String get data => _data;

  Node? get left => _left;

  set left(Node? node) {
    _left = node;
  }

  Node? get right => _right;

  set right(Node? node) {
    _right = node;
  }
}
