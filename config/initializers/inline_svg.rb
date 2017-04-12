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
  #config.asset_file = AssetFile.new
  #config.asset_finder = AssetFinder.new
  config.add_custom_transformation(attribute: :custom, transform: MyCustomTransform)
  config.add_custom_transformation(attribute: :default, transform: DefaultTransform, default_value: 'some-default')
end
