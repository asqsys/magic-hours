//
//  Graph.swift
//  Magic Hours
//
//  Created by Quentin Cornu on 28/10/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

class Graph: UIView {
    
    // MARK: - Private properties
    
    private var values = [Int]()
    
    // MARK: - Subviews
    
    private let horizontalAxis: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    private let verticalAxis: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    private let dataContainerView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        for _ in 1...10 {
            let view = UIView()
            stackView.addArrangedSubview(view)
        }
        
        return stackView
    }()
    
    // MARK: - Constructor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAxis()
        
        values = [4, 5, 6, 8, 9, 3, 1, 10, 0, 8]
        fillGraph()
        
        
        setupDataContainer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions
    
    private func setupAxis() {
        addSubview(horizontalAxis)
        horizontalAxis.translatesAutoresizingMaskIntoConstraints = false
        horizontalAxis.heightAnchor.constraint(equalToConstant: 2).isActive = true
        horizontalAxis.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        horizontalAxis.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        horizontalAxis.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(verticalAxis)
        verticalAxis.translatesAutoresizingMaskIntoConstraints = false
        verticalAxis.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        verticalAxis.widthAnchor.constraint(equalToConstant: 2).isActive = true
        verticalAxis.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        verticalAxis.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    }
    
    private func setupDataContainer() {
        addSubview(dataContainerView)
        dataContainerView.translatesAutoresizingMaskIntoConstraints = false
        dataContainerView.leftAnchor.constraint(equalTo: verticalAxis.rightAnchor, constant: 2).isActive = true
        dataContainerView.bottomAnchor.constraint(equalTo: horizontalAxis.topAnchor, constant: -2).isActive = true
        dataContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        dataContainerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
    }
    
    private func fillGraph() {
        
        let barContainers = dataContainerView.subviews
        
        if (values.count > 10) {
            print("ERROR : Too many values of a 10 values graph")
            return
        }
        
        for index in 0..<values.count {
            
            if (values[index] > 10) {
                print("ERROR : Values must be of max values : 10")
                return
            }
            
            let subview = barContainers[index]
            
            let bar = UIView()
            bar.backgroundColor = UIColor.darkGray
            
            subview.addSubview(bar)
            bar.translatesAutoresizingMaskIntoConstraints = false
            bar.leftAnchor.constraint(equalTo: subview.leftAnchor).isActive = true
            bar.bottomAnchor.constraint(equalTo: subview.bottomAnchor).isActive = true
            bar.rightAnchor.constraint(equalTo: subview.rightAnchor).isActive = true
            bar.heightAnchor.constraint(equalTo: subview.heightAnchor, multiplier: CGFloat(values[index])/10).isActive = true
        }
    }
    
}
