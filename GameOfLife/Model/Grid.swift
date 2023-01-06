//
//  Grid.swift
//  GameOfLife
//
//  Created by Vladimir Berezin on 06.01.23.
//

import Foundation

struct Grid {

    struct GridSize {
        let height: Int
        let width: Int

        init(size: Int) {
            height = size
            width = size
        }
    }

    private let size: GridSize
    private(set) var cells: [[Int]]

    init(size: GridSize) {
        self.size = size
        cells = Array(repeating: Array(repeating: 0, count: size.height), count: size.width)
    }

    mutating func generation() {
        var nextCells = Array(repeating: Array(repeating: 0, count: size.height), count: size.width)
        for x in 0..<size.width {
            for y in 0..<size.height {
                nextCells[x][y] = staysAlive(x, y, isAlive: cells[x][y] == 0 ? false : true) ? 1 : 0
            }
        }
        cells = nextCells
    }

    mutating func random() {
        for y in 0..<size.height {
            for x in 0..<size.width {
                let randomState = arc4random_uniform(2)
                cells[y][x] = randomState == 0 ? 0 : 1
            }
        }
    }

    mutating private func staysAlive(_ x: Int, _ y: Int, isAlive: Bool) -> Bool {

        var count = 0

        let pairs = [
            [-1,-1], [0,-1], [1,-1],
            [-1, 0],         [1, 0],
            [-1, 1], [0, 1], [1, 1]
        ]

        for pair in pairs {
            let xd = x + pair[0]
            let yd = y + pair[1]
            if xd >= 0 && yd >= 0 &&
                xd < size.width && yd < size.height && cells[xd][yd] == 1 { count += 1 }
        }
        if isAlive && (count == 2 || count == 3) {
            return true
        } else if !isAlive && count == 3 {
            return true
        }
        return false
    }
}
