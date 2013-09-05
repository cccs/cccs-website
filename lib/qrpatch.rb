require 'rqrcode_png'

# Monkey-patch qr generator
module RQRCodePNG
  class Sequence
    def border_width()
      # No boundary around image
      0
    end
  end
end
