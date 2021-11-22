//
//  ActivityViewController.swift
//  ControlWork_2
//
//  Created by Rishat on 22.11.2021.
//

import UIKit
import Combine

//MARK: - ActivityViewController

class ActivityViewController: UIViewController {

    private var serviceSubscriber: AnyCancellable?

    private var contentTextView: UITextView = {
        let view = UITextView()
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1

        return view
    }()

    //MARK: - Initialize
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    private func setupUI() {
        title = "Activity"
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(resetButtonTapped))

        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [.font: UIFont.systemFont(ofSize: 34, weight: .bold),
                                                     .foregroundColor: UIColor.label]
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance

        view.addSubview(contentTextView)

        contentTextView.snp.makeConstraints { make in
            make.height.equalTo(205)
            make.top.equalTo(segmentedControl.snp.bottom).offset(41)
            make.leading.equalToSuperview().offset(19)
            make.trailing.equalToSuperview().inset(18)
        }

    }

    //MARK: - @objc Methods

    @objc func resetButtonTapped() {

    }

    private func fetchActivity() {

        serviceSubscriber = DataManager().dogPublisher
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { dog in
                self.dog = dog
            })
    }

    
}
