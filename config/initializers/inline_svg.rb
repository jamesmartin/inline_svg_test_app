# Examples of all the configurable bits of inline_svg

class AssetFile
  # Should return a String representing the SVG document requested by filename
  # This example always returns the same SVG from the public/ dir
  def named(filename)
    File.read(Rails.root.join("public/iconmonstr-wrench-7.svg"))
  end
end

class AssetFinder
  # Should return a Pathname object that will be read from disk
  def find_asset(name)
    Rails.root.join("public/iconmontstr-wrench-7.svg")
  end
end

InlineSvg.configure do |config|
  # Example of using a custom asset file:
  #config.asset_file = AssetFile.new

  # Example of using a custom asset finder:
  #config.asset_finder = AssetFinder.new

  # Example of using boot-time cached asset files
  #config.asset_file = InlineSvg::CachedAssetFile.new(
  #  paths: [
  #    Rails.root.join("app", "assets", "images"),
  #    Rails.root.join("public")
  #  ],
  #  filters: /\.svg/
  #)

  # Examples of using cusotm transformations
  config.add_custom_transformation(attribute: :custom, transform: MyCustomTransform)
  config.add_custom_transformation(attribute: :default, transform: DefaultTransform, default_value: 'some-default')
end
