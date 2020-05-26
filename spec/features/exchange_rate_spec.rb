require "spec_helper"
require "exchange_rate"

describe "I want to " do
  it "get all valutes" do
    valutes = ExchangeRate.all
    # in documentation of service we can see that they give us information about 34 valutes
    expect(valutes.count).to eq 34
  end

  it "get usd" do
    valute = ExchangeRate.get_by_code "usd"
    expect(valute.name).to eq "Доллар США"
  end

  it "get 10 USD in RUB" do
    valute = ExchangeRate.get_by_code "usd"
    result = valute.multiple 10
    expect(result).to eq valute.value * 10
  end
end
