require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
  test "свойства товара не должны оставаться пустыми" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "цена товара должна быть положительной" do
    product = Product.new(title: "my book title",
                          description: "yyy",
                          image_url: "qwe.jpg")
    product.price = -1
    assert product.invalid?
    assert_equal "должна быть больше или равна 0,01",
    product.errors[:price].join('; ')

    product.price = 0
    assert product.invalid?
    assert_equal "должна быть больше или равна 0,01",
    product.errors[:price].join('; ')

    product.price = 1
    assert product.valid?
  end

  def new_product(image_url)
    Product.new(title: "my book title",
                description: "qqq",
                price: 1,
                image_url: image_url)
  end

  test "url изображения" do
    ok=%w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
           http://a.b.c/x/y/z/fred.gif}
    bad=%w{ fred.doc fred.gif/more fred.gif.more}

    ok.each do |name|
      assert new_product(name).valid?, "#{name} должно быть приемлемым"
    end

    bad.each do |name|
      assert new_product(name).invalid?, "#{name} не должно быть приемлемым"
    end
  end

  test "если у товара нет уникального названия то он недопустим" do
    product = Product.new(title: products(:ruby).title,
                          description: "www",
                          price: 1,
                          image_url: "fred.gif")
    assert !product.save
    assert_equal "уже было использовано", product.errors[:title].join('; ')
  end

end
