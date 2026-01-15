// @ts-check

/**
 * Implement the classes etc. that are needed to solve the
 * exercise in this file. Do not forget to export the entities
 * you defined so they are available for the tests.
 */
export class Size {
    constructor(width = 80, height = 60) {
        this.width = width;
        this.height = height;
    }

    /**
       * @param {number} width
       * @param {number} height
       */
    resize(width, height) {
        this.width = width;
        this.height = height;
    }
}

export class Position {
    constructor(x = 0, y = 0) {
        this.x = x;
        this.y = y;
    }

    /**
     * @param {number} x
     * @param {number} y
     */
    move(x, y) {
        this.x = x;
        this.y = y;
    }
}

export class ProgramWindow {
    constructor() {
        this.screenSize = new Size(800, 600);
        this.size = new Size(); // Default size
        this.position = new Position(); // Default position
    }

    /**
     * @param {Size} size
     */
    resize(size) {
        if (size.width < 1) {
            size.width = 1;
        }
        if (size.height < 1) {
            size.height = 1;
        }

        // Ensure the new size does not exceed the screen bounds considering the current position
        if (this.position.x + size.width > 800) {
            size.width = 800 - this.position.x;
        }
        if (this.position.y + size.height > 600) {
            size.height = 600 - this.position.y;
        }

        this.size.width = size.width;
        this.size.height = size.height;
    }

    /**
     * @param {Position} pos
     */
    move(pos) {
        if (pos.x < 0) {
            pos.x = 0;
        }
        if (pos.y < 0) {
            pos.y = 0;
        }
        if (pos.x + this.size.width > 800) {
            pos.x = 800 - this.size.width;
        }
        if (pos.y + this.size.height > 600) {
            pos.y = 600 - this.size.height;
        }

        this.position.x = pos.x;
        this.position.y = pos.y;
    }
}

/**
 * @param {ProgramWindow} window
 */
export function changeWindow(window) {
    window.resize(new Size(400, 300));
    window.move(new Position(100, 150));
    return window;
}