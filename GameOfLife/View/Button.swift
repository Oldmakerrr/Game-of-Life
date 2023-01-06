//
//  Button.swift
//  GameOfLife
//
//  Created by Vladimir Berezin on 06.01.23.
//

import UIKit

final class Button: UIButton {

    let didTap: () -> Void

    init(title: String, frame: CGRect = .zero, didTap: @escaping () -> Void) {
        self.didTap = didTap
        super.init(frame: frame)
        addTarget(self, action: #selector(buttonHandler), for: .touchUpInside)
        setTitle(title, for: .normal)
        setTitleColor(.orange, for: .normal)
        layer.cornerRadius = 12
        backgroundColor = .gray
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func buttonHandler() {
        didTap()
    }
}
