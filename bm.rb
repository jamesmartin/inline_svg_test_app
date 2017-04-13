class InlineSvgTest
  include InlineSvg::ActionView::Helpers
end

TEST_FILES = [
  "iconmonstr-wrench-7",
  "iconmonstr-glasses-12-icon"
]

def run_benchmark(iterations=1000, files=TEST_FILES)
  puts "Benchmarking SVG embedding..."

  a = InlineSvgTest.new

  options = {class: "IconNav-img mb-2", width: "64", height: "56"}

  Benchmark.bm do |x|
    x.report(:inline_svg_fs) do
      iterations.times do
        Array(files).each do |f|
          a.inline_svg(f, options)
        end
      end
    end
  end
end
