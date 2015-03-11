module FuckingFavicons
  class Middleware
    def initialize(app, options = {})
      @app = app
      @favicon_path = options[:favicon_path] || options[:path]

      unless @favicon_path
        GLOBS.each do |glob|
          first = Dir.glob(glob).first

          if first
            @favicon_path = first

            if STDERR.tty?
              warn "FuckingFavicon: #{ @favicon_path }"
            end

            break
          end
        end
      end

      begin
        MiniMagick::Image.open(@favicon_path)
      rescue
        warn "FuckingFavicon: #{ @favicon_path }"
        raise
      end

      CONFIG.each do |c|
        c[:regex] = %r'\A(?:/assets/|/)?#{ Regexp.escape( c[:path] )}'
      end
    end

    def call(env)
      config = CONFIG.detect{|c| env['PATH_INFO'] =~ c[:regex]}

      return @app.call(env) unless config

      favicon = FuckingFavicons.favicon_for(@favicon_path, config)

      [200, favicon[:headers], [favicon[:body]]]
    end
  end
end
