def viewDidLoad
  image = UIImage.imageNamed("logo.png")
  imageView = UIImageView.alloc.initWithImage(image)
  imageView.contentMode = UIViewContentModeScaleToFill;
  imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
  self.view.addSubview(imageView)
  self.view.sendSubviewToBack(imageView)
  super
end
