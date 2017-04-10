# Add a custom transformation

class AssetFinder
  def find_asset(name)
  end
end

InlineSvg.configure do |config|
  #config.asset_finder = AssetFinder.new
  config.add_custom_transformation(attribute: :custom, transform: MyCustomTransform)
  config.add_custom_transformation(attribute: :default, transform: DefaultTransform, default_value: 'some-default')
end
