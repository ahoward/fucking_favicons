module FuckingFavicons
  class Engine < ::Rails::Engine
    engine_name :fucking_favicons

    config.before_initialize do |config|
      config.middleware.use FuckingFavicons::Middleware
    end

    paths['app/views'] << FuckingFavicons.libdir('app/views')

    FuckingFavicons::GLOBS.unshift(Rails.root.join('app/assets/images/favicon.png'))
  end
end
