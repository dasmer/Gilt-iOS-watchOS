import UIKit
import GiltKit
import AlamofireImage

class SalesViewController: UITableViewController {

    private let client = Client()

    private var sales = [Sale]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(SaleCell.self, forCellReuseIdentifier: NSStringFromClass(SaleCell.self))
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        client.listSalesForStore(.Men, kind: .Upcoming) { sales in
            dispatch_async(dispatch_get_main_queue()) {
                self.sales = sales
            }
        }
    }


    // MARK- UITableViewDataSource

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sales.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(SaleCell.self), forIndexPath: indexPath) as? SaleCell else { return UITableViewCell() }

        let sale = sales[indexPath.row]

        cell.photoView.af_setImageWithURL(sale.imageURL)

        cell.nameLabel.text = sale.name
        return cell
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150
    }
}

