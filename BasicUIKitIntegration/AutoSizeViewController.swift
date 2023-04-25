// Copyright © 2022 Flipp. All rights reserved.

import UIKit
import FlippShopperSDK

class AutoSizeViewController: UIViewController {
    private let scrollView = UIScrollView()
    private var webview: FPWebView!
    private let containerView = UIView()
    private let tableView = ContentSizedTableView()
    private var items = ["Banana", "Apples", "Milk", "Cheese", "Banana", "Orange", "Coffee", "Tea", "Toiler papaer", "Beer", "Salmon", "Pork", "Pineapple", "Potato", "Onions", "Garlic", "Tomato", "Water", "Sour cream", "Wheat", "Whisky", "Cabbage", "Mint", "Book", "Soda", "Charger", "Notebook", "Cheese", "Honey", "Turkey", "Jinjer", "Lemon", "Bread", "Shampoo", "Yogurt"]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Auto size"
        FPShopperSDK.shared.configure(.dev, siteId: "1192075", zoneIds: ["260678"], publisherName: "wishabi-test-publisher", contentCode: "flipp-sdk")

        webview = FPWebView(viewController: self, features: [.addToList])
        webview.nativeXdelegate = self

        tableView.dataSource = self

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "basicStyle")

        setupConstraints()
    }

    private func setupConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        webview.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(tableView)
        containerView.addSubview(webview)
        let guide = scrollView.contentLayoutGuide
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true

        containerView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor).isActive = true
        containerView.backgroundColor = .yellow

        tableView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true

        webview.topAnchor.constraint(equalTo: tableView.bottomAnchor).isActive = true
        webview.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        webview.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        webview.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }

}

// MARK: UITableViewDataSource

extension AutoSizeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicStyle", for: indexPath)

        cell.textLabel!.text = items[indexPath.row]
        return cell
    }

}

// MARK: NativeXDelegate

extension AutoSizeViewController: NativeXDelegate {

    func didTap(item: String) {
        if items.contains(item) {
            items = items.filter{ $0 != item }
        } else {
            items.append(item)
        }
        tableView.reloadData()
    }

    func didFinishLoad(contentHeight: Double) {}

    func didFailToLoad(error: Error) {
        let alert = UIAlertController(title: nil, message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}

