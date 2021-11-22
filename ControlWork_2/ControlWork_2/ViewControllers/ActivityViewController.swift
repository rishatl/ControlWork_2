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

    @Published private var activityData = ActivityData()

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

    //MARK: - 

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

        contentTextView.centerText()
        view.addSubview(contentTextView)
        contentTextView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            contentTextView.heightAnchor.constraint(equalToConstant: 205),
            contentTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            contentTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            view.bottomAnchor.constraint(equalTo: contentTextView.safeAreaLayoutGuide.bottomAnchor, constant: 100),
            view.trailingAnchor.constraint(equalTo: contentTextView.trailingAnchor, constant: 18)
        ])

    }


    private func fetchActivity() {

        serviceSubscriber = DataManager().publisher
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { activity in
                self.activityData = activity
                self.contentTextView.text = self.activityData.activity
            })
    }

    //MARK: - @objc Methods

    @objc func resetButtonTapped() {
        fetchActivity()
    }

}
