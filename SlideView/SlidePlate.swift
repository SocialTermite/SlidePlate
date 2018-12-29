//
//  File.swift
//  SlideView
//
//  Created by Konstantin Bondar on 15/12/2018.
//  Copyright © 2018 SocialTermite. All rights reserved.
//

import UIKit
import SnapKit

class SlidePlate: UIView {
    private var containerView: UIView
    fileprivate var constraintController: SPConstraintController?
    fileprivate var stateController: SPStateController?
    
    var color: UIColor = .red
    var cornerRadius: CGFloat = 5
    
    static func install(_ view: UIView, into superview: UIView, at position: SPPosition) -> SlidePlate {
        let plate = SlidePlate(containerView: view)
        
        plate.constraintController = SPConstraintController(with: plate, in: position)
        plate.constraintController?.install(into: superview)
        
        plate.stateController = SPStateController()
        plate.stateController?.actionDelegate = plate.constraintController
        
        return plate
    }
    
    func show() {
        stateController?.state = .showed
    }
    
    func hide() {
        stateController?.state = .default
    }
    
    private(set) var state: SPStateController.State? {
        get {
            return stateController?.state
        }
        set {
            stateController?.state = newValue ?? .default
        }
    }
    
    private func setupView() {
        backgroundColor = color
        layer.cornerRadius = cornerRadius
        
        addSubview(containerView) { (maker) in
            maker.left.top.equalTo(5)
            maker.bottom.right.equalTo(-5)
        }
    }
    
    // MARK: - init
    private init(containerView: UIView) {
        self.containerView = containerView
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




extension Comparable {
    func clamp(low: Self, high: Self) -> Self {
        if (self > high) {
            return high
        } else if (self < low) {
            return low
        }
        
        return self
    }
}


