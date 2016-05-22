import WatchKit

class SalesInterfaceController: WKInterfaceController {

    @IBOutlet var tableView: WKInterfaceTable!

    static private let SaleTableRowControllerRowType = "SaleTableRowController"

    override func willActivate() {
        super.willActivate()
    }

    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        pushControllerWithName("SaleInterfaceController", context: nil)
    }
}
