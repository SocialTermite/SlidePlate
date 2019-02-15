//
//  SPInstaller.swift
//  SlideView
//
//  Created by Konstantin Bondar on 29/12/2018.
//  Copyright © 2018 SocialTermite. All rights reserved.
//

import UIKit
import SnapKit

public class SPConstraintHolder {
    private(set) var vertical: Constraint?
    private(set) var horizontal: Constraint?
    
    private(set) var position: SPPosition
    private(set) var peakSize: CGFloat
    private(set) var plate: SlidePlate
    
    init(for plate: SlidePlate, parentView: UIView, at position: SPPosition, config: SPController.AppearanceConfig) {
        self.plate = plate
        self.position = position
        self.peakSize = config.peakSize
        parentView.addSubview(plate)
        plate.snp.makeConstraints { (make) in
            vertical = installVerticalConstraint(constraintMaker: make, superView: parentView, position: position)
            horizontal = installHorizontalConstraint(constraintMaker: make, superView: parentView, position: position)
        }
    }

    private func installVerticalConstraint(constraintMaker: ConstraintMaker, superView: UIView, position: SPPosition) -> Constraint? {
        switch position.vertical {
        case .top:
            return constraintMaker.bottom.equalTo(superView.snp.top).offset(peakSize).constraint
        case .bottom:
            return constraintMaker.top.equalTo(superView.snp.bottom).offset(-peakSize).constraint
        case .y(let pos):
            return constraintMaker.top.equalTo(superView.snp.top).offset(pos).constraint
        }
    }

    private func installHorizontalConstraint(constraintMaker: ConstraintMaker, superView: UIView, position: SPPosition) -> Constraint? {
        switch position.horizontal {
        case .left:
            return constraintMaker.right.equalTo(superView.snp.left).offset(peakSize).constraint
        case .right:
            return constraintMaker.left.equalTo(superView.snp.right).offset(-peakSize).constraint
        case .x(let pos):
            return constraintMaker.right.equalTo(superView.snp.left).offset(pos).constraint
        }
    }
    
    func updateConstraints(_ updateMaker: (ConstraintMaker) -> Void) {
        self.plate.snp.updateConstraints(updateMaker)
        self.plate.superview?.layoutIfNeeded()
    }
    
}
