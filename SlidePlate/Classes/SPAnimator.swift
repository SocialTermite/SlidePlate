//
//  SPAnimator.swift
//  SlideView
//
//  Created by Konstantin Bondar on 15.02.19.
//  Copyright © 2019 SocialTermite. All rights reserved.
//

import UIKit

public class SPAnimator: SPActionDelegate {
    private let constraintHolder: SPConstraintHolder
    
    public init(constraintHolder: SPConstraintHolder, config: Config) {
        self.constraintHolder = constraintHolder
    }
    
    public func appear() {
        
    }
    
    public func show() {
        UIView.animate(withDuration: 0.6,
                       delay: 0.0,
                       options: .allowUserInteraction,
                       animations: {
                        self.constraintHolder.updateConstraints {[weak self] (update) in
                            guard let strongSelf = self else {
                                return
                            }
                            if strongSelf.constraintHolder.position.isVertical {
                                let sign: CGFloat = strongSelf.constraintHolder.position.vertical.isTop() ? 1 : -1
                                strongSelf.constraintHolder.vertical?.update(offset: (strongSelf.constraintHolder.plate.bounds.height) * sign)
                            } else {
                                let sign: CGFloat = strongSelf.constraintHolder.position.horizontal.isLeft() ? 1 : -1
                                strongSelf.constraintHolder.horizontal?.update(offset: (strongSelf.constraintHolder.plate.bounds.width) * sign)
                            }
                        }
        })
    }

    
    public func startEdit() {
        
    }
    
    public func stopEdit() {
        
    }
    
    public func hide() {
        UIView.animate(withDuration: 0.6, animations: {
            self.constraintHolder.updateConstraints {[weak self] (update) in
                guard let strongSelf = self else {
                    return
                }
                if strongSelf.constraintHolder.position.isVertical {
                    let sign: CGFloat = strongSelf.constraintHolder.position.vertical.isTop() ? 1 : -1
                    strongSelf.constraintHolder.vertical?.update(offset: strongSelf.constraintHolder.peakSize * sign)
                } else {
                    let sign: CGFloat = strongSelf.constraintHolder.position.horizontal.isLeft() ? 1 : -1
                    strongSelf.constraintHolder.horizontal?.update(offset: strongSelf.constraintHolder.peakSize * sign)
                }
            }
        })
    }
    
    public func dissapear() {
        
    }
}

extension SPAnimator {
    public class Config {
        public init() {
            
        }
    }
}
