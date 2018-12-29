//
//  SPInstaller.swift
//  SlideView
//
//  Created by Konstantin Bondar on 29/12/2018.
//  Copyright © 2018 SocialTermite. All rights reserved.
//

import UIKit
import SnapKit

class SPConstraintController {
    private var vertical: Constraint?
    private var horizontal: Constraint?
    
    private weak var plate: SlidePlate? = nil
    
    private let position: SPPosition
    
    init(with plate: SlidePlate, in position: SPPosition) {
        self.plate = plate
        self.position = position
    }
    
    func install(into view: UIView) {
        guard let plateView = plate else {
            return
        }
        view.addSubview(plateView)
        plateView.snp.makeConstraints { (make) in
            vertical = installVerticalConstraint(constraintMaker: make, superView: view, position: position)
            horizontal = installHorizontalConstraint(constraintMaker: make, superView: view, position: position)
        }
    }
    

    func installVerticalConstraint(constraintMaker: ConstraintMaker, superView: UIView, position: SPPosition) -> Constraint? {
        switch position.vertical {
        case .top:
            return constraintMaker.bottom.equalTo(superView.snp.top).offset(5).constraint
        case .bottom:
            return constraintMaker.top.equalTo(superView.snp.bottom).offset(-5).constraint
        case .y(let pos):
            return constraintMaker.top.equalTo(superView.snp.top).offset(pos).constraint
        }
    }

    func installHorizontalConstraint(constraintMaker: ConstraintMaker, superView: UIView, position: SPPosition) -> Constraint? {
        switch position.horizontal {
        case .left:
            return constraintMaker.right.equalTo(superView.snp.left).offset(5).constraint
        case .right:
            return constraintMaker.left.equalTo(superView.snp.right).offset(-5).constraint
        case .x(let pos):
            return constraintMaker.right.equalTo(superView.snp.left).offset(pos).constraint
        }
    }
    
}

extension SPConstraintController: SPActionDelegate {
    func appear() {
        
    }
    
    func show() {
        UIView.animate(withDuration: 2,
                       delay: 0.0,
                       options: .allowUserInteraction,
                       animations: {
                        self.plate?.snp.updateConstraints { (update) in
                            if self.position.isVertical {
                                let sign: CGFloat = self.position.vertical.isTop() ? 1 : -1
                                self.vertical?.update(offset: (self.plate?.bounds.height ?? 0) * sign)
                            } else {
                                let sign: CGFloat = self.position.horizontal.isLeft() ? 1 : -1
                                self.horizontal?.update(offset: (self.plate?.bounds.width ?? 0) * sign)
                            }
                        }
                        self.plate?.superview?.layoutIfNeeded()
        })
    }
    
    func startEdit() {
        
    }
    
    func stopEdit() {
        
    }
    
    func hide() {
        
        
        UIView.animate(withDuration: 1, animations: {
            self.plate?.snp.updateConstraints { (update) in
                if self.position.isVertical {
                    let sign: CGFloat = self.position.vertical.isTop() ? 1 : -1
                    self.vertical?.update(offset: (5) * sign)
                } else {
                    let sign: CGFloat = self.position.horizontal.isLeft() ? 1 : -1
                    self.horizontal?.update(offset: (5) * sign)
                }
            }
            self.plate?.superview?.layoutIfNeeded()
        })
    }
    
    func dissapear() {
        
    }
    
    
}
