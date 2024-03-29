require('minitest/autorun')
require('minitest/rg')
require_relative('../pub')
require_relative('../customer')
require_relative('../drink')

class TestPub < MiniTest::Test

def setup

# @drinks = ["beer", "wine", "gin", "whiskey"]
  @drinks = { @beer => 5,
              @wine => 3,
              @gin => 7,
              @whiskey => 4
  }
  # @beer = Drink.new("Beer", 20, 2)
  #
  # @drinks = { @beer: 5
  # }
    @pub = Pub.new("Central Perk", 100, @drinks)
    @customer = Customer.new("Dave", 500,[],25,0)
    @customer1 = Customer.new("Phil",100,[],26,15)

    @beer = Drink.new("Beer", 5, 2)
    @wine = Drink.new("Wine", 10, 4)
    @gin = Drink.new("Gin", 8, 5)
    @whiskey = Drink.new("Whiskey", 10, 6)
  end

  def test_pub_name
    assert_equal("Central Perk", @pub.name)
  end

  def test_total_till_value
    assert_equal(100, @pub.till)
  end

  def test_number_of_drinks
    assert_equal(19, @pub.number_of_drinks(@drinks))
  end

  def test_add_to_till
    assert(120,@pub.add_to_till(20))
  end

  def  test_drink_purchase
    drink = Drink.new("Beer", 20,0)
    assert_equal(120, @pub.add_to_till(drink.price))
    assert_equal(480, @customer.cust_remove_cash(drink.price))
  end

  def test_check_cust_age
    assert_equal(25, @pub.check_age(@customer))
  end

  def test_check_cust_drunkeness
    assert_equal(0,@pub.check_drunkeness(@customer))
  end

  def test_refusal_level
    assert_equal("refuse", @pub.refusal_level(@customer1))
    assert_equal("serve", @pub.refusal_level(@customer))
  end

  def test_pub_stock_value
    assert_equal(151, @pub.pub_stock_value(@drinks))
  end
end
