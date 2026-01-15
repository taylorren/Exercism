/* These implementation definitions enable zero-argument contructors:
 *    throw EmptyBufferException();
 */

class EmptyBufferException implements Exception {}

class FullBufferException implements Exception {}

class CircularBuffer {
  List<int> buffer = [];
  int readPosition = 0;
  int writePosition = 0;

  CircularBuffer(int size) {
    buffer = List<int>.filled(size, 0);
  }

  void write(int value, {bool force = false}) {
    if (buffer[writePosition] != 0 && !force) {
      throw FullBufferException();
    }
    if (force) {
      readPosition = (writePosition + 1) % buffer.length;
    }
    
    buffer[writePosition] = value;
    writePosition = (writePosition + 1) % buffer.length;
  }

  int read() {
    if (buffer[readPosition] == 0) {
      throw EmptyBufferException();
    }
    int value = buffer[readPosition];
    buffer[readPosition] = 0;
    readPosition = (readPosition + 1) % buffer.length;

    return value;
  }

  void clear() {
    for (int i = 0; i < buffer.length; i++) {
      buffer[i] = 0;
    }
    readPosition = 0;
    writePosition = 0;
  }
}
