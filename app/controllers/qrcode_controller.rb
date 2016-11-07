# Main Controller
class QrcodeController < ApplicationController

  def index

        # qrcode = RQRCode::QRCode.new("http://github.com/")
        # # With default options specified explicitly
        # png = qrcode.as_png(
        #   resize_gte_to: false,
        #   resize_exactly_to: false,
        #   fill: 'white',
        #   color: 'black',
        #   size: 120,
        #   border_modules: 4,
        #   module_px_size: 6,
        #   file: nil # path to write
        # )
        # IO.write("/tmp/github-qrcode.png", png.to_s)

    # @qr = RQRCode::QRCode.new('https://github.com/whomwah/rqrcode', size: 4, level: 0.1)
    # @qr = RQRCode::QRCode.new(params[:q])

    qrcode = RQRCode::QRCode.new(params[:q])
    # With default options specified explicitly
    png = qrcode.as_png(
      resize_gte_to: false,
      resize_exactly_to: false,
      fill: 'white',
      color: 'black',
      size: 240,
      border_modules: 1,
      module_px_size: 6,
      file: nil # path to write
    )

    # data = open("http://www.gravatar.com/avatar/c2713a4959692f16d27d2553fb06cc4b.png?r=x&s=170") 
    send_data png, type: 'image/png', disposition: 'inline'

  end

end
