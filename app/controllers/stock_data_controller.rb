class StockDataController < ApplicationController
  def show
    yahoo_client = YahooFinance::Client.new
    @data = yahoo_client.historical_quotes("AAPL", { start_date: Time::now-(24*60*60*30), end_date: Time::now })
    labels = []
    prices = []
    @data.each do |item|
      labels << item.trade_date
      prices << item.close
    end
    results = {
      labels: labels.reverse,
      datasets: [
        {
          label: "Stock Prices",
          fillColor: "rgba(220,220,220,0.5)",
          strokeColor: "rgba(220,220,220,0.8)",
          highlightFill: "rgba(220,220,220,0.75)",
          highlightStroke: "rgba(220,220,220,1)",
          data: prices.reverse
        }
      ]
    }
    render json: results
  end
end
