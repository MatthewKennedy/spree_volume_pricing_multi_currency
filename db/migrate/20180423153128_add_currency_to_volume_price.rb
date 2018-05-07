class AddCurrencyToVolumePrice < SpreeExtension::Migration[4.2]
  def change
    add_column :spree_volume_prices, :currency, :string
  end
end
