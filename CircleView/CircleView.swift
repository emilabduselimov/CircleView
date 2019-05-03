//
//  CircleView.swift
//  CustomTitleView
//
//  Created by Emil Abduselimov on 28/04/2019.
//  Copyright © 2019 Emil Abduselimov. All rights reserved.
//

import UIKit

class CircleView: UIView {

    var hidesWhenStopped = false

    private(set) var isAnimating = false

    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }

    private lazy var circleLayer: CAShapeLayer = {
        guard let circleLayer = layer as? CAShapeLayer else {
            return CAShapeLayer()
        }

        return circleLayer
    }()

    private lazy var rotationAnimation: CABasicAnimation = {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0
        animation.toValue = CGFloat.pi * 2
        animation.duration = 1
        animation.repeatCount = .greatestFiniteMagnitude
        return animation
    }()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayer()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayer()
    }

    // MARK: - Lifecycle

    override func didMoveToWindow() {
        super.didMoveToWindow()
        if window != nil, isAnimating {
            startAnimating()
        }
    }

    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()
        circleLayer.path = UIBezierPath(ovalIn: bounds).cgPath
    }

    // MARK: - Setup Layer

    private func setupLayer() {
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeStart = 0
        circleLayer.strokeEnd = 0.9
        circleLayer.lineWidth = 2
        circleLayer.strokeColor = tintColor.cgColor
    }

    // MARK: - Animation

    func startAnimating() {
        guard circleLayer.animation(forKey: rotationAnimation.keyPath ?? "") == nil else {
            return
        }

        circleLayer.add(rotationAnimation, forKey: rotationAnimation.keyPath)
        isAnimating = true
        isHidden = false
    }

    func stopAnimating() {
        circleLayer.removeAllAnimations()
        isAnimating = false
        isHidden = hidesWhenStopped ? true : false
    }
}
