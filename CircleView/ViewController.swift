//
//  ViewController.swift
//  CircleView
//
//  Created by Emil Abduselimov on 03/05/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let circleView = CircleView(frame: .zero)

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(circleView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        circleView.frame = CGRect(x: 100, y: 100, width: 40, height: 40)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !circleView.isAnimating {
            circleView.startAnimating()
        }
    }

}

