class InlineSvgTest
  TEST_FILES = [
    "iconmonstr-wrench-7",
    "iconmonstr-glasses-12-icon"
  ]
  include InlineSvg::ActionView::Helpers
end


namespace :benchmark do
  desc "Benchmark the inline_svg gem"
  task :inline_svg, [:iterations, :files] => :environment  do |t, args|
    iterations = (args[:iterations] || 1000).to_i
    files = args[:files] || InlineSvgTest::TEST_FILES

    puts "Benchmarking SVG embedding..."

    a = InlineSvgTest.new

    options = {class: "some-class", width: "42", height: "42"}

    Benchmark.bm do |x|
      x.report(:inline_svg) do
        iterations.times do
          Array(files).each do |f|
            a.inline_svg(f, options)
          end
        end
      end
    end
  end
end
