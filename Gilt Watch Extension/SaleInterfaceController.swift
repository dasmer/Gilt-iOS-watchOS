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

        let url = NSURL(string: "http://cdn.wpfreeware.com/wp-content/uploads/2014/09/placeholder-images.jpg")!
        imageDownloader.downloadImage(URLRequest: NSURLRequest(URL: url)) { response in
            dispatch_async(dispatch_get_main_queue()) {
                self.loadingImageLabel.setHidden(true)
                self.photoView.setHidden(false)
                self.photoView.setImage(response.result.value)
            }
        }
    }
}
