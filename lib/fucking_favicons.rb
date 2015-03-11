module FuckingFavicons
#
  extend(self)

#
  require_relative 'fucking_favicons/version'

#
  def libdir(*args, &block)
    if args.blank? and block.blank?
      @libdir ||= (
        dirname, basename = File.split(File.expand_path(__FILE__))
        base = basename.split('.').first
        File.join(dirname, base).freeze
      )
    else
      File.join(libdir, *args.flatten.compact.map(&:to_s))
    end
  end

#
  CONFIG = [
    { path: 'favicon.ico', size: [16, 16], mime_type: 'image/x-icon', format: 'ICO' },
    { path: 'favicon-16x16.png', size: [16, 16] },
    { path: 'favicon-32x32.png', size: [32, 32] },
    { path: 'favicon-96x96.png', size: [96, 96] },
    { path: 'favicon-160x160.png', size: [160, 160] },
    { path: 'favicon-196x196.png', size: [196, 196] },
    { path: 'mstile-70x70.png', size: [70, 70] },
    { path: 'mstile-144x144.png', size: [144, 144] },
    { path: 'mstile-150x150.png', size: [150, 150] },
    { path: 'mstile-310x310.png', size: [310, 310] },
    { path: 'mstile-310x150.png', size: [310, 150] },
    { path: 'apple-touch-icon-57x57.png', size: [57, 57] },
    { path: 'apple-touch-icon-60x60.png', size: [60, 60] },
    { path: 'apple-touch-icon-72x72.png', size: [72, 72] },
    { path: 'apple-touch-icon-76x76.png', size: [76, 76] },
    { path: 'apple-touch-icon-114x114.png', size: [114, 114] },
    { path: 'apple-touch-icon-120x120.png', size: [120, 120] },
    { path: 'apple-touch-icon-144x144.png', size: [144, 144] },
    { path: 'apple-touch-icon-152x152.png', size: [152, 152] },
    { path: 'apple-touch-icon.png', size: [57, 57] },
    { path: 'apple-touch-icon-precomposed.png', size: [57, 57] },
  ]

#
  SIZES = CONFIG.map{|h| h[:size]}

#
  PATHS = CONFIG.map{|h| h[:path]}

#
  CACHE = {}

#
  GLOBS = [
    FuckingFavicons.libdir('app/assets/images/favicon.png')
  ]

#
  if defined?(Rack)
    require_relative 'fucking_favicons/middleware'
  end

#
  if defined?(Rails)
    require_relative 'fucking_favicons/rails'
  end

#
  def favicon_for(path, info)
    key = [path, info.map{|kv| kv.join('=')}.join('&')].join('?')

    CACHE[key] ||= (
      image = MiniMagick::Image.open(path)

      dimensions = info[:size].join('x')

      image.resize(dimensions)

      if info[:format]
        image.format(info[:format] || 'png')
      end

      body           = image.to_blob
      content_length = body.bytesize.to_s
      content_type   = image.mime_type =~ /ico/ ? 'image/x-icon' : image.mime_type
      last_modified  = File.stat(path).mtime.httpdate

      favicon = {
        :body             => body,
        :content_length   => content_length,
        :content_type     => content_type,
        :last_modified    => last_modified,

        :headers => {
          'Content-Length' => content_length,
          'Content-Type'   => content_type,
          'Last-Modified'  => last_modified
        }
      }
    )
  end
end
