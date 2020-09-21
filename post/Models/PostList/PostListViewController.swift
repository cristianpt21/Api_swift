//
//  PostListViewController.swift
//  post
//
//  Created by Stone web on 21/09/20.
//

import UIKit

class PostListViewController: UIViewController {

    @IBOutlet weak var postTable: UITableView! {
        didSet {
            postTable.register(UINib(nibName: "PostListTableViewCell", bundle: nil), forCellReuseIdentifier: "postCell")
            postTable.dataSource = self
            postTable.delegate = self
        }
    }
    
    var postArray: [PostShow] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCell()
    }
    
    func configCell() {
        Manager.getPostsList(page: 0) { (listPosts) in
            self.postArray.append(contentsOf: listPosts)
            self.postTable.reloadData()
        }
        title = "List Post"
    }
}
extension PostListViewController: UITableViewDataSource,
UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentShow = postArray[indexPath.row]
        let row = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)
        (row as? PostListTableViewCell)?.configurateRow(post: currentShow)
        
        row.selectionStyle = .none
        
        return row
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let storyboard = UIStoryboard(name: "SeriesDetailViewController", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "SeriesDetailViewController") as! PostListViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }

}
