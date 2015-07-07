# Add a custom transformation

InlineSvg.configure do |config|
  config.add_custom_transformation(attribute: :custom, transform: MyCustomTransform)
end
