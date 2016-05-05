import UIKit

class SaleCell: UITableViewCell {

    lazy var photoView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .ScaleAspectFit
        return imageView
    }()

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .Center
        return label
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(photoView)
        contentView.addSubview(nameLabel)

        photoView.leadingAnchor.constraintEqualToAnchor(contentView.leadingAnchor).active = true
        photoView.trailingAnchor.constraintEqualToAnchor(contentView.trailingAnchor).active = true
        photoView.topAnchor.constraintEqualToAnchor(contentView.topAnchor).active = true

        nameLabel.leadingAnchor.constraintEqualToAnchor(contentView.leadingAnchor).active = true
        nameLabel.trailingAnchor.constraintEqualToAnchor(contentView.trailingAnchor).active = true
        nameLabel.topAnchor.constraintEqualToAnchor(photoView.bottomAnchor).active = true
        nameLabel.bottomAnchor.constraintEqualToAnchor(contentView.bottomAnchor).active = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        photoView.af_cancelImageRequest()
        photoView.image = nil
    }
}
