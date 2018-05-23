Spree::BaseHelper.class_eval do
  def display_volume_price(variant, quantity = 1, user=nil)
    Spree::Money.new(variant.volume_price(quantity, user), { currency: Spree::Config[:currency] }).to_html
  end

  def display_volume_price_earning_percent(variant, quantity = 1, user=nil)
    variant.volume_price_earning_percent(quantity, user).round.to_s
  end

  def display_volume_price_earning_amount(variant, quantity = 1, user=nil)
    Spree::Money.new(variant.volume_price_earning_amount(quantity, user), { currency: Spree::Config[:currency] }).to_html
  end

  def free_shipping_at(currency=nil)
    if !currency
      Spree::Config[:free_shipping_at]
    else
      ss=Spree::ShippingMethod.all.select{|s| s.calculator.try(:preferred_currency)==currency}
      ss.select{|s| s.can_be_free}.sort{|s1,s2| s1.free_over.to_f<=>s2.free_over.to_f}.first.free_over
    end
  end


end
