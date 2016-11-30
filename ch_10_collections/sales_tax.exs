defmodule SalesTax do
  @tax_rates = [ NC: 0.075, TX: 0.08 ]

  def calculate(orders) do 
    orders |> Enum.map(&(_total_amount(&1))
  end

  defp _total_amount(order = [id: _, ship_to: state, net_amount: net]) do
    tax_rate = Keyword.get(tax_rates, state, 0)
    tax = net * tax_rate
    total = net + tax
    Keyword.put(order, :total_amount, 0)
  end
end

orders = [
    [ id: 123, ship_to: :NC, net_amount: 100.00 ],
    [ id: 124, ship_to: :OK, net_amount: 100.00 ],
    [ id: 125, ship_to: :TX, net_amount: 100.00 ]
]
