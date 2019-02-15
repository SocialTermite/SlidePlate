//
//  SPController.swift
//  SlideView
//
//  Created by Konstantin Bondar on 15.02.19.
//  Copyright © 2019 SocialTermite. All rights reserved.
//

import UIKit

class SPController {
    private let plate: SlidePlate
    private let stateController: SPStateController
    private let constraintHolder: SPConstraintHolder
    private let animator: SPAnimator
    var config: AppearanceConfig = AppearanceConfig()
    
    private init(containerView: UIView, into parentView: UIView, at position: SPPosition, animationConfig: SPAnimator.Config) {
        self.plate = SlidePlate(containerView: containerView, config: config)
        self.constraintHolder = SPConstraintHolder(for: self.plate, parentView: parentView, at: position, config: config)
        
        self.animator = SPAnimator(constraintHolder: self.constraintHolder, config: animationConfig)
        self.stateController = SPStateController(actionDelegate: self.animator)
        
        self.plate.userTapped = self.stateController.userTapped
    }
    
    static func install(containerView: UIView, into parentView: UIView, at position: SPPosition, animationConfig: SPAnimator.Config) -> SPController {
        return .init(containerView: containerView, into: parentView, at: position, animationConfig: animationConfig)
    }
}

extension SPController {
    struct AppearanceConfig {
        var peakSize: CGFloat = 10
        var borderColor = UIColor.red.cgColor
        var borderWidth:CGFloat = 10
        var cornerRadius: CGFloat = 10
        var containerMargins = 10
        var backgroundColor = UIColor.green
    }
}
