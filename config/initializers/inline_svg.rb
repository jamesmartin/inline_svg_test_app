# Add a custom transformation

InlineSvg.configure do |config|
  config.add_custom_transformation(attribute: :custom, transform: MyCustomTransform)
  config.add_custom_transformation(attribute: :default, transform: DefaultTransform, default_value: 'some-default')
end
