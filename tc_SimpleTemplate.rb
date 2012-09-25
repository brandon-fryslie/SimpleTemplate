require 'simpleTemplate'
require 'test/unit'

# Brandon Fryslie
#
# 9/24/2012
#
# Tests for SimpleTemplate class

class TestSimpleTemplate < Test::Unit::TestCase

  # Test most basic replacements
  def test_simple
    final = 'Billy has an appointment on Thursday'
    data = { :day => 'Thursday', :name => 'Billy' }
    tpl = '${name} has an appointment on ${day}'
    assert_equal(final, SimpleTemplate.compile(data, tpl))
  end

  # Test non-workingness of recursive replacements
  def test_escape
    final = 'hello ${Billy}'
    data = { :day => 'Thursday', :name => 'Billy' }
    tpl = 'hello ${${name}}'
    assert_equal(final, SimpleTemplate.compile(data, tpl))
  end

  # Test backslash escaping
  def test_backslash_escape
    final = 'hello ${name}'
    data = { :name => 'Billy' }
    tpl = 'hello \${name}'
    assert_equal(final, SimpleTemplate.compile(data, tpl))
  end

  # Test throw argument on missing data
  def test_fail_if_missing_key_in_data
    final = 'Billy has an appointment on Thursday'
    data = { :name => 'Billy' }
    tpl = '${name} has an appointment on ${day}'
    assert_raise ArgumentError do
      SimpleTemplate.compile(data, tpl)
    end
  end
end
