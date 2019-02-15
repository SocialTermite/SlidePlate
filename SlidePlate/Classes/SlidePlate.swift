//
//  File.swift
//  SlideView
//
//  Created by Konstantin Bondar on 15/12/2018.
//  Copyright © 2018 SocialTermite. All rights reserved.
//

import UIKit
import SnapKit

public class SlidePlate: UIView {
    private var containerView: UIView
    fileprivate var tapButton = UIButton(type: .custom)
    
    var userTapped: (() -> ())?
    
    private func setupView(config: SPController.AppearanceConfig) {
        
        backgroundColor = config.backgroundColor
        layer.borderColor = config.borderColor
        layer.borderWidth = config.borderWidth
        layer.cornerRadius = config.cornerRadius
        
        addSubview(containerView) { (maker) in
            maker.left.top.equalTo(config.containerMargins)
            maker.bottom.right.equalTo(-config.containerMargins)
        }
        
        
        tapButton.setTitle("", for: .normal)
        addSubview(tapButton) { (maker) in
            maker.edges.equalToSuperview()
        }
        tapButton.addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
    
    @objc private func tapped() {
        userTapped?()
    }
    
    // MARK: - init
    init(containerView: UIView, config: SPController.AppearanceConfig) {
        self.containerView = containerView
        super.init(frame: .zero)
        setupView(config: config)
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


