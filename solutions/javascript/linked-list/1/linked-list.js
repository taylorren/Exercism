//
// This is only a SKELETON file for the 'Linked List' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export class LinkedList {
  constructor() {
    this.head = null;
    this.tail = null;
    this.length = 0;
  }

  push(value) {
    const newNode = new Node(value);
    if (!this.head) {
      this.head = newNode;
      this.tail = newNode;
    } else {
      newNode.prev = this.tail; 
      this.tail.next = newNode;
      this.tail = newNode;
    }
    this.length++;
  }

  pop() {
    if (!this.tail) return null;
    const poppedNode = this.tail;
    this.tail = this.tail.prev;
    if (this.tail) {
      this.tail.next = null;
    } else {
      this.head = null; 
    }
    this.length--;
    return poppedNode.value;
  }

  shift() {
    if (!this.head) return null;
    const shiftedNode = this.head;
    this.head = this.head.next;
    if (this.head) {
      this.head.prev = null; 
    } else {
      this.tail = null; 
    }
    this.length--;
    return shiftedNode.value;
  }

  unshift(value) {
    const newNode = new Node(value);
    if (!this.head) {
      this.head = newNode;
      this.tail = newNode;
    } else {
      newNode.next = this.head; 
      this.head.prev = newNode; 
      this.head = newNode;
    }
    this.length++;
  }

  delete(value) {
    if (!this.head) return;
    let current = this.head;
    while (current) {
      if (current.value === value) {
        if (current.prev) {
          current.prev.next = current.next; 
        } else {
          this.head = current.next; 
        }
        if (current.next) {
          current.next.prev = current.prev; 
        } else {
          this.tail = current.prev; 
        }
        this.length--;
        return;
      }
      current = current.next;
    }
  }

  count() {
    return this.length;
  }
}

class Node {
  constructor(value) {
    this.value = value;
    this.next = null;
    this.prev = null; 
  }
}
