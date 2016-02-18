require 'test_helper'

class BookmarkTest < ActiveSupport::TestCase
  def setup
    @mark = Bookmark.new(url: "http://google.com", title: "test title")
  end

  test "should be valid" do
    assert @mark.valid?
  end

  test "url should be present" do
    @mark.url = ""
    assert_not @mark.valid?
  end

  test "title should be present" do
    @mark.title = ""
    assert_not @mark.valid?
  end

  test "valid urls should work" do
    @mark.title = "hey"
    valid_urls = %w[https://google.com http://www.zombo.com http://espn.go.com/nba/]
    valid_urls.each do |valid_url|
      @mark.url = valid_url
      assert @mark.valid?, "#{valid_url.inspect} should be valid"
    end
  end

  test "invalid urls should not work" do
    @mark.title = "hey"
  	invalid_urls = %w[hey google.com http//google.com http://google.com!]
  	invalid_urls.each do |invalid_url|
  	  @mark.url = invalid_url
  	  assert_not @mark.valid?, "#{invalid_url.inspect} should be invalid"
  	end
  end
end
