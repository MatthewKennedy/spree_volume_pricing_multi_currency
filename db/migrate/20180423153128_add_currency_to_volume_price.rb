class AddCurrencyToVolumePrice < SpreeExtension::Migration[4.2]
  def change
    add_column :spree_volume_prices, :currency, :string
    Spree::VolumePrice.update_all(currency: Spree::Config[:currency])
  end
end
