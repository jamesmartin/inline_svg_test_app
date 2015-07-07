# See the readme for more on custom transformations:
# https://github.com/jamesmartin/inline_svg/blob/master/README.md#custom-transformations

class MyCustomTransform < InlineSvg::CustomTransformation
  def transform(doc)
    doc = Nokogiri::XML::Document.parse(doc.to_html)
    svg = doc.at_css('svg')
    svg['custom'] = value
    doc
  end
end
