//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //MARK: Variables
    
    var player: AVAudioPlayer!
    
    private lazy var buttonC: UIButton = {
        var button = UIButton(type: .custom)
        button.setTitle("C", for: .normal)
        button.titleLabel?.font = (.systemFont(ofSize: 40))
        button.backgroundColor = .systemRed
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(keyPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonD: UIButton = {
        var button = UIButton(type: .custom)
        button.setTitle("D", for: .normal)
        button.titleLabel?.font = (.systemFont(ofSize: 40))
        button.backgroundColor = .systemOrange
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(keyPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonE: UIButton = {
        var button = UIButton(type: .custom)
        button.setTitle("E", for: .normal)
        button.titleLabel?.font = (.systemFont(ofSize: 40))
        button.backgroundColor = .systemYellow
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(keyPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonF: UIButton = {
        var button = UIButton(type: .custom)
        button.setTitle("F", for: .normal)
        button.titleLabel?.font = (.systemFont(ofSize: 40))
        button.backgroundColor = .systemGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(keyPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonG: UIButton = {
        var button = UIButton(type: .custom)
        button.setTitle("G", for: .normal)
        button.titleLabel?.font = (.systemFont(ofSize: 40))
        button.backgroundColor = .systemIndigo
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(keyPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonA: UIButton = {
        var button = UIButton(type: .custom)
        button.setTitle("A", for: .normal)
        button.titleLabel?.font = (.systemFont(ofSize: 40))
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(keyPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonB: UIButton = {
        var button = UIButton(type: .custom)
        button.setTitle("B", for: .normal)
        button.titleLabel?.font = (.systemFont(ofSize: 40))
        button.backgroundColor = .systemPurple
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(keyPressed), for: .touchUpInside)
        return button
    }()
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(buttonC)
        view.addSubview(buttonD)
        view.addSubview(buttonE)
        view.addSubview(buttonF)
        view.addSubview(buttonG)
        view.addSubview(buttonA)
        view.addSubview(buttonB)
    }
    
    override func viewWillLayoutSubviews() {
        setupConstraints()
    }


    //MARK: Methods
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            buttonC.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            buttonC.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            buttonC.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            buttonC.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            buttonD.topAnchor.constraint(equalTo: buttonC.bottomAnchor, constant: 10),
            buttonD.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            buttonD.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            buttonD.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            buttonE.topAnchor.constraint(equalTo: buttonD.bottomAnchor, constant: 10),
            buttonE.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            buttonE.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            buttonE.heightAnchor.constraint(equalToConstant: 100)
        ])

        NSLayoutConstraint.activate([
            buttonF.topAnchor.constraint(equalTo: buttonE.bottomAnchor, constant: 10),
            buttonF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonF.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            buttonG.topAnchor.constraint(equalTo: buttonF.bottomAnchor, constant: 10),
            buttonG.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            buttonG.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            buttonG.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            buttonA.topAnchor.constraint(equalTo: buttonG.bottomAnchor, constant: 10),
            buttonA.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            buttonA.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            buttonA.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            buttonB.topAnchor.constraint(equalTo: buttonA.bottomAnchor, constant: 10),
            buttonB.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            buttonB.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            buttonB.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc func keyPressed(_ sender: UIButton) {
        playSound(soundName: sender.currentTitle!)
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
               player = try! AVAudioPlayer(contentsOf: url!)
               player.play()
    }

}


