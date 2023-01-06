//
//  GridView.swift
//  GameOfLife
//
//  Created by Vladimir Berezin on 06.01.23.
//

import UIKit

final class GridView: UIStackView {

    var grid: Grid

    init(_ grid: Grid, frame: CGRect = .zero) {
        self.grid = grid
        super.init(frame: frame)
        setupCells()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCells() {
        configureGrid(axis: .horizontal)
        grid.cells.forEach { colum in
            let colomView = UIStackView()
            colomView.configureGrid(axis: .vertical)
            colum.forEach { row in
                let cell = UIView()
                cell.backgroundColor = .white
                colomView.addArrangedSubview(cell)
            }
            addArrangedSubview(colomView)
        }
    }

    func redraw() {
        for (y, subviews) in arrangedSubviews.enumerated() {
            if let column = (subviews as? UIStackView)?.arrangedSubviews {
                for (x, cell) in column.enumerated() {
                    cell.backgroundColor = grid.cells[y][x] == 0 ? .white : .black
                }
            }
        }
    }
    
}

extension UIStackView {

    func configureGrid(axis: NSLayoutConstraint.Axis, spacing: CGFloat = 0.2) {
        self.axis = axis
        self.spacing = spacing
        distribution = .fillEqually
    }

}
