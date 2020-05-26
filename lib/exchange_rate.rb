require "net/http"
require "json"

class ExchangeRate
  attr_reader :name, :code, :value

  def initialize(info)
    @name = info["Name"]
    @code = info["CharCode"]
    @value = info["Value"]
  end

  def multiple(num)
    @value * num
  end

  def self.all
    result = []
    response = get_json
    response.values.each do |elem|
      result.push ExchangeRate.new(elem)
    end
    result
  end

  def self.get_by_code(code)
    response = get_json[code.upcase]
    ExchangeRate.new response
  end

  def to_s
    "#{@code} \t #{@value} \t #{@name}"
  end

  def self.get_json
    url = URI("https://www.cbr-xml-daily.ru/daily_json.js")
    response = Net::HTTP.get url
    JSON.parse(response)["Valute"]
  end
end
