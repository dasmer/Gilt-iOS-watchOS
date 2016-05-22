import WatchKit
import GiltKit

class SalesInterfaceController: WKInterfaceController {

    @IBOutlet var tableView: WKInterfaceTable!

    static private let SaleTableRowControllerRowType = "SaleTableRowController"

    private let client = Client()

    private var sales = [Sale]() {
        didSet {
            tableView.setNumberOfRows(sales.count, withRowType: self.dynamicType.SaleTableRowControllerRowType)

            for (index, sale) in sales.enumerate() {
                guard let row = tableView.rowControllerAtIndex(index) as? SaleTableRowController else { continue }
                row.nameLabel.setText(sale.name)
            }
        }
    }

    override func willActivate() {
        super.willActivate()
        client.listSalesForStore(.Men, kind: .Upcoming) { [weak self] sales in
            dispatch_async(dispatch_get_main_queue()) {
                self?.sales = sales
            }
        }
    }

    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        pushControllerWithName("SaleInterfaceController", context: SaleWrapper(sales[rowIndex]))
    }
}
