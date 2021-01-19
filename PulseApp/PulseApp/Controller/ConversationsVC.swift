//
//  ConversationsVC.swift
//  PulseApp
//
//  Created by Hiram Castro on 17/01/21.
//

import UIKit

private let reuseIdentifier = "ConversationCell"

class ConversationsVC: UIViewController {
    
    //MARK: - PROPERTIES
    
    private let tableView = UITableView()
    
    //MARK: - LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBar()
        configureTableView()
        configuregUI()
    }
    
    //MARK: - SELECTORS
    @objc private func showProfileButtonPressed() {
        
    }
    
    //MARK: - HELPERS
    private func configuregUI() {
        self.view.backgroundColor = .white
        
        let imageIcon = UIImage(systemName: "person.circle.fill")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: imageIcon, style: .plain, target: self, action: #selector(showProfileButtonPressed))
    }
    
    private func configureNavBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor:UIColor.white]
        appearance.backgroundColor = .systemTeal
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Messages"
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.overrideUserInterfaceStyle = .dark
    }
    
    private func configureTableView() {
        self.view.addSubview(tableView)
        tableView.backgroundColor = .white
        
        tableView.frame = self.view.frame
        tableView.rowHeight = 80
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.tableFooterView = UIView()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension ConversationsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ConversationsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        return cell
    }
    
    
}
