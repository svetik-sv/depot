require 'test_helper'

class CartTest < ActiveSupport::TestCase
  def setup
    @cart = Cart.create
    @book_one = products(:ruby)
    @book_two = products(:two)
  end

  test 'в корзине должна добавляться новая строка товара при добавлении нового продукта' do
    @cart.add_product(@book_one).save!
    @cart.add_product(@book_two).save!
    assert_equal 2, @cart.line_items.size

  end

  test 'в корзине должна обновляться строка товара при добавлении уже существующего продукта' do
    @cart.add_product(@book_one.id).save!
    @cart.add_product(@book_one.id).save!
    assert_equal 2*@book_one.price, @cart.total_price
    assert_equal 1, @cart.line_items.size
    assert_equal 2, @cart.line_items[0].quantity
  end
end
