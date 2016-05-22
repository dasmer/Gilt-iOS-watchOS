import UIKit
import AlamofireImage

class SalesViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(SaleCell.self, forCellReuseIdentifier: NSStringFromClass(SaleCell.self))
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

    }


    // MARK- UITableViewDataSource

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(SaleCell.self), forIndexPath: indexPath) as? SaleCell else { return UITableViewCell() }

        let url = NSURL(string: "http://cdn.wpfreeware.com/wp-content/uploads/2014/09/placeholder-images.jpg")!
        cell.photoView.af_setImageWithURL(url)
        cell.nameLabel.text = nil

        return cell
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150
    }
}
