# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
#Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "components","ammap","dist","ammap")

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w(icons-000000.png)
Rails.application.config.assets.precompile += %w(icons-ffffff.png)
Rails.application.config.assets.precompile += %w(icons-000000@2x.png)
Rails.application.config.assets.precompile += %w(icons-ffffff@2x.png)
Rails.application.config.assets.precompile += %w( tipsy/tipsy.gif )
Rails.application.config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)