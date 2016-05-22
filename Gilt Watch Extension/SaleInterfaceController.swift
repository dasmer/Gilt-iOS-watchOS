import WatchKit
import AlamofireImage
import GiltKit

class SaleInterfaceController: WKInterfaceController {

    @IBOutlet var loadingImageLabel: WKInterfaceLabel!
    @IBOutlet var photoView: WKInterfaceImage!
    @IBOutlet var nameLabel: WKInterfaceLabel!
    @IBOutlet var descriptionLabel: WKInterfaceLabel!

    let imageDownloader = ImageDownloader()

    var sale: Sale?

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        guard let sale = (context as? SaleWrapper)?.sale else { return }
        self.sale = sale
    }

    override func willActivate() {
        super.willActivate()

        guard let sale = sale else { return }
        nameLabel.setText(sale.name)
        descriptionLabel.setText(sale.description)
        imageDownloader.downloadImage(URLRequest: NSURLRequest(URL: sale.imageURL)) { response in
            dispatch_async(dispatch_get_main_queue()) {
                self.loadingImageLabel.setHidden(true)
                self.photoView.setHidden(false)
                self.photoView.setImage(response.result.value)
            }
        }
    }
}
