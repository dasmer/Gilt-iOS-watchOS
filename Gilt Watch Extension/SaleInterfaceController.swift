import WatchKit
import AlamofireImage

class SaleInterfaceController: WKInterfaceController {

    @IBOutlet var loadingImageLabel: WKInterfaceLabel!
    @IBOutlet var photoView: WKInterfaceImage!
    @IBOutlet var nameLabel: WKInterfaceLabel!
    @IBOutlet var descriptionLabel: WKInterfaceLabel!

    let imageDownloader = ImageDownloader()

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
    }

    override func willActivate() {
        super.willActivate()

        nameLabel.setText(nil)
        descriptionLabel.setText(nil)

        imageDownloader.downloadImage(URLRequest: NSURLRequest(URL: NSURL())) { response in
            dispatch_async(dispatch_get_main_queue()) {
                self.loadingImageLabel.setHidden(true)
                self.photoView.setHidden(false)
                self.photoView.setImage(response.result.value)
            }
        }
    }
}
