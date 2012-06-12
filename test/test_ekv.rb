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

    assert_equal 'tata', foo.kv_store['toto']

    assert_equal true, foo.kv_store.frozen?

    assert_equal true, foo.update_key('toto', 'tutu')
    assert_equal false, foo.update_key('totu', 'tutu')

    assert_equal 'tutu', foo.get_key('toto')
    foo = Foo.last
    assert_equal 'tutu', foo.get_key('toto')

  end

  def test_key
    foo = Foo.new
    foo.save

    assert_equal nil, foo.key('foo')

    assert_equal true, foo.key('foo', 'bar')
    assert_equal 'bar', foo.key('foo')

    foo = Foo.last

    assert_equal 'bar', foo.key('foo')
    assert_equal true, foo.key('foo', 'baz')
    assert_equal 'baz', foo.key('foo')

    foo = Foo.last
    assert_equal 'baz', foo.key('foo')

  end

end

