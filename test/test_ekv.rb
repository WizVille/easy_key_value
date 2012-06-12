require 'init_tests'
require 'easy_key_value'
require 'test/unit'
require 'models/Foo'

load 'schema.rb'

class EayKeyValueTest < Test::Unit::TestCase


  def test_get_set
    foo = Foo.new
    foo.save

    assert_equal true, foo.add_key('foo', 'bar')
    assert_equal false, foo.add_key('foo', 'bar')

    assert_equal 'bar', foo.get_key('foo')
  end

end

