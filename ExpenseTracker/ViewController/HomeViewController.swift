//
//  ViewController.swift
//  ExpenseTracker
//
//  Created by Kazi Shakawat Hossain Ratul on 3/12/25.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController {

    let homeCardView = HomeCardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        homeCardView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(homeCardView)
        
        NSLayoutConstraint.activate([
            homeCardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            homeCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            homeCardView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}

struct HomeViewController_Previews: PreviewProvider {
  static var previews: some View {
    Container().edgesIgnoringSafeArea(.all)
  }
  struct Container: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
      UINavigationController(rootViewController: HomeViewController())
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    typealias UIViewControllerType = UIViewController
  }
}
