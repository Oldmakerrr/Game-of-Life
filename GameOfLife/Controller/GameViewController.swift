//
//  GameViewController.swift
//  GameOfLife
//
//  Created by Vladimir Berezin on 06.01.23.
//

import UIKit

final class GameViewController: UIViewController {

    private let grid = Grid(size: .init(size: 50))
    private lazy var gridView = GridView(grid)
    private var timer = Timer()

    private var isGameRun = false {
        didSet { startButton.setTitle(isGameRun ? "Stop" : "Start", for: .normal) }
    }

    private lazy var startButton = Button(title: "Start") { [weak self] in
        self?.startButtonHandler()
    }

    private lazy var randomButton = Button(title: "Randoize") { [weak self] in
        self?.randomHandler()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray3
        setupGrid()
        setupButton()
    }

    private func startButtonHandler() {
        isGameRun ? stopGame() : runGame()
        isGameRun.toggle()
    }

    private func randomHandler() {
        gridView.grid.random()
        gridView.redraw()
    }

    private func runGame() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { _ in
            self.gridView.grid.generation()
            self.gridView.redraw()
        }
    }

    private func stopGame() {
        timer.invalidate()
    }

    private func setupGrid() {
        view.addSubview(gridView)
        gridView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gridView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            gridView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            gridView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            gridView.heightAnchor.constraint(equalTo: gridView.widthAnchor)
        ])
    }

    private func setupButton() {
        view.addSubview(startButton)
        view.addSubview(randomButton)
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: gridView.bottomAnchor, constant: 50),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 100),
            startButton.heightAnchor.constraint(equalToConstant: 50),

            randomButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 50),
            randomButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            randomButton.widthAnchor.constraint(equalToConstant: 100),
            randomButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}

