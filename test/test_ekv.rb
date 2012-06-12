require 'init_tests'
require 'easy_key_value'
require 'test/unit'
require 'models/Foo'

load 'schema.rb'

class EayKeyValueTest < Test::Unit::TestCase


  def test_get_set_del
    foo = Foo.new
    foo.save

    assert_equal true, foo.add_key('foo', 'bar')
    assert_equal false, foo.add_key('foo', 'bar')

    assert_equal 'bar', foo.get_key('foo')
    assert_equal true, foo.del_key('foo')
    assert_equal false, foo.del_key('foo')
    assert_equal false, foo.del_key('bar')
    assert_equal nil, foo.get_key('foo')

    foo.add_key('toto', 'tata')

    foo = Foo.last

    assert_equal 'tata', foo.get_key('toto')

  end

end

