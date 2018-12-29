//
//  SPStateController.swift
//  SlideView
//
//  Created by Konstantin Bondar on 29/12/2018.
//  Copyright © 2018 SocialTermite. All rights reserved.
//

import Foundation

typealias Action = () -> ()

protocol SPActionDelegate: class {
    func appear()
    
    func show()
    
    func startEdit()
    
    func stopEdit()
    
    func hide()
    
    func dissapear()
}

class SPStateController {
    enum State: Int {
        case outOfScreen
        case `default`
        case showed
        case editing
    }
    
    weak var actionDelegate: SPActionDelegate? = nil
    
    var state: State = .default {
        didSet {
            guard state != oldValue else {
                return
            }
            
            let action = state.rawValue > oldValue.rawValue ? forwardRoute[state] : backwardRoute[state]
            action??()
        }
    }
    
    private lazy var forwardRoute: [State: Action?] = [.outOfScreen: nil,
                                                      .default: self.actionDelegate?.appear,
                                                      .showed: self.actionDelegate?.show,
                                                      .editing: self.actionDelegate?.startEdit]
    private lazy var backwardRoute: [State: Action?] = [.outOfScreen: self.actionDelegate?.dissapear,
                                                        .default: self.actionDelegate?.hide,
                                                        .showed: self.actionDelegate?.stopEdit,
                                                        .editing: nil]
}
