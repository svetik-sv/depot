require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "Подтверждение заказа в ....", mail.subject
    assert_equal ["first@example.com"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match "....", mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "Заказ из .... отправлен", mail.subject
    assert_equal ["first@example.com"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match "...", mail.body.encoded
  end

end
