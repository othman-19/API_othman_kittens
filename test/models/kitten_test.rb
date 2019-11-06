require 'test_helper'

class KittenTest < ActiveSupport::TestCase
  def setup
    @kitten = Kitten.new(name: 'Chicha', age: 2, cuteness: "cute", softness: "soft")
  end

  test 'valid kitten' do
    assert @kitten.valid?
  end

  test 'invalid without name' do
    @kitten.name = nil
    refute @kitten.valid?, 'saved user without a name'
    assert_not_nil @kitten.errors[:name], 'no validation error for name present'
  end

  test 'invalid without email' do
    @kitten.age = nil
    refute @kitten.valid?
    assert_not_nil @kitten.errors[:email]
  end
end