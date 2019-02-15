//
//  ViewController.swift
//  SlideView
//
//  Created by Konstantin Bondar on 15/12/2018.
//  Copyright © 2018 SocialTermite. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .white
    }

    var plate: SPController!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let contView = UIView()
        contView.backgroundColor = .green
        let label = UILabel()
        label.text = "hello fasdkflkadjhasdfsldjfhal h;lajhf"
        label.numberOfLines = 0
        contView.addSubview(label) { (maker) in
            maker.edges.equalToSuperview()
        }
        contView.snp.makeConstraints { (maker) in
            maker.width.equalTo(50)
        }
        
        let fakeView = UIView()
        fakeView.layer.borderColor = UIColor.blue.cgColor
        fakeView.layer.borderWidth = 1
        view.addSubview(fakeView) { (maker) in
            maker.top.equalTo(250)
            maker.left.equalTo(100)
            maker.size.equalTo(200)
        }
        plate = SPController.install(containerView: contView, into: view, at:  SPPosition(horizontal: .left, vertical: .y(150)), animationConfig: SPAnimator.Config())
    }
}

