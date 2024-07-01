//
//  ViewController.swift
//  HackerNews
//
//  Created by Siran Li on 6/25/24.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var newsTable: UITableView!
    private var newsViewModel = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
        fetchData(from: Constants.newsUrl)
    }
}

extension NewsViewController {
    func setup() {
        newsTable.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        newsTable.dataSource = self
        newsTable.rowHeight = 100
    }
    
    func fetchData(from urlString: String) {
        Task{
            await newsViewModel.fetchNews(urlString: urlString) {
                DispatchQueue.main.async {
                    self.newsTable.reloadData()
                }
            }
        }
    }
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsViewModel.getNews().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = newsTable.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as? NewsTableViewCell else {
            fatalError("NewsTableViewCell cannot be dequeued!")
        }
        cell.configureNewsCell(hit: newsViewModel.getNews()[indexPath.row])
        return cell
    }
}

