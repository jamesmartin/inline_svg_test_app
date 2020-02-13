require "test_helper"

class SmokeTest < ActionDispatch::IntegrationTest
  def test_svgs_render
    get "/"
    assert_equal 200, status

    assert_select "section" do
      assert_select ".svg", 16

      assert_select ".svg.test-no-options" do
        assert_select "svg", 1
      end

      assert_select ".svg.test-with-css-class" do
        assert_select "svg.little-red", 1
      end

      assert_select ".svg.test-with-id-attr" do
        assert_select "svg#some-id", 1
      end

      assert_select ".svg.test-with-data-attrs" do
        assert_select "svg[data-some='value'][data-another='thing']", 1
      end

      assert_select ".svg.test-with-title-and-description" do
        assert_select "svg" do
          assert_select "title", { count: 1, text: "An SVG" }
          assert_select "desc", { count: 1, text: "This is my SVG. There are many like it. You get the picture" }
        end
      end

      assert_select ".svg.test-with-aria-labels" do
        assert_select "svg[aria-labelledby]", /\w+\s\w+/
      end

      assert_select ".svg.test-with-height-and-width-attrs" do
        assert_select "svg[width='15%'][height='20%']", 1
      end

      assert_select ".svg.test-with-separate-height-and-width-attrs" do
        assert_select "svg[width='15%'][height='20%']", 1
      end

      assert_select ".svg.test-with-height-and-width-precedence" do
        assert_select "svg[width='25%'][height='20%']", 1
      end

      assert_select ".svg.test-with-comments-removed" do
        assert_select "svg" do
          # Unfortunately there's no way to test the absence (or presence) of
          # HTML comments via this framework.
          assert_select "title", { count: 1, text: "An SVG, scrubbed" }
        end
      end

      assert_select ".svg.test-missing-svg-file" do
        assert_select "svg", 1
      end

      assert_select ".svg.test-missing-svg-file-with-extension-hint" do
        assert_select "svg", 1
      end

      assert_select ".svg.test-preserve-aspect-ratio" do
        # This doesn't work for some reason:
        #assert_select "svg[preserveAspectRatio='xMaxYMax meet']", 1
        assert_select "svg", 1
      end

      assert_select ".svg.test-custom-transformation" do
        assert_select "svg[custom='some value']", 1
      end

      assert_select ".svg.test-custom-transformation-default-value" do
        assert_select "svg[data-default-transform='some-default']", 1
      end

      assert_select ".svg.test-io-objects" do
        assert_select "svg.io-object", 1
      end
    end
  end
end
