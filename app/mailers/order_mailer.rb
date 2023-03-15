class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_receipt_email(order)
    @order = order
    email_body = build_email_body
    mail(to: @order.email, subject: "Order Receipt - Order ID: #{@order.id}", content_type: "text/html", body: email_body)
  end

  private

  def build_email_body
    email_body = "<h2>Order Receipt</h2>"
    email_body << "<p>Thank you for your order!</p>"
    email_body << "<p>Order ID: #{@order.id}</p>"
    email_body << "<hr>"

    @order.line_items.each do |line_item|
      email_body << "<p>Product: #{line_item.product.name}<br>"
      email_body << "Quantity: #{line_item.quantity}<br>"
      email_body << "Price: #{line_item.product.price}</p>"
      email_body << "<hr>"
    end

    email_body << "<p>Total: #{@order.total_cents / 100.0}</p>"
    email_body
  end
end
