require "net/http"

class StaticPagesController < ApplicationController
  def btc
	@bid = Hash.new
    @ask = Hash.new
  	url = "https://api.binance.com/api/v3/depth?symbol=BTCUSDT&limit=5000"
  	resp = Net::HTTP.get_response(URI.parse(url))
    data = JSON.parse(resp.body)
    data['bids'].each do |bid|
    	if bid[1].to_f > 5
			@bid.store(bid[0].to_f.round(0), bid[1].to_f.round(0))
    	end
    end

    data['asks'].each do |ask|
	   	if ask[1].to_f > 5
			@ask.store(ask[0].to_f.round(0), ask[1].to_f.round(0))
	    end
	end 

	url_price = "https://api.binance.com/api/v3/avgPrice?symbol=BTCUSDT"
	resp = Net::HTTP.get_response(URI.parse(url_price))
    @price = JSON.parse(resp.body)
    @price = @price['price'].to_f.round(2)
	#puts data['bids'][0][1] #-> amount of bid
  end

  def eth
  	@bid = Hash.new
    @ask = Hash.new
  	url = "https://api.binance.com/api/v3/depth?symbol=ETHUSDT&limit=5000"
  	resp = Net::HTTP.get_response(URI.parse(url))
    data = JSON.parse(resp.body)
    data['bids'].each do |bid|
    	if bid[1].to_f >= 100
			@bid.store(bid[0].to_f.round(0), bid[1].to_f.round(0))
    	end
    end

    data['asks'].each do |ask|
	   	if ask[1].to_f >= 100
			@ask.store(ask[0].to_f.round(0), ask[1].to_f.round(0))
	    end
	end 

	url_price = "https://api.binance.com/api/v3/avgPrice?symbol=ETHUSDT"
	resp = Net::HTTP.get_response(URI.parse(url_price))
    @price = JSON.parse(resp.body)
    @price = @price['price'].to_f.round(2)
  end

  def ltc
	@bid = Hash.new
    @ask = Hash.new
  	url = "https://api.binance.com/api/v3/depth?symbol=LTCUSDT&limit=5000"
  	resp = Net::HTTP.get_response(URI.parse(url))
    data = JSON.parse(resp.body)
    data['bids'].each do |bid|
    	if bid[1].to_f > 500
			@bid.store(bid[0].to_f.round(0), bid[1].to_f.round(0))
    	end
    end

    data['asks'].each do |ask|
	   	if ask[1].to_f > 500
			@ask.store(ask[0].to_f.round(0), ask[1].to_f.round(0))
	    end
	end 

	url_price = "https://api.binance.com/api/v3/avgPrice?symbol=LTCUSDT"
	resp = Net::HTTP.get_response(URI.parse(url_price))
    @price = JSON.parse(resp.body)
    @price = @price['price'].to_f.round(2)
	#puts data['bids'][0][1] #-> amount of bid
  end

  def xrp
	@bid = Hash.new
    @ask = Hash.new
  	url = "https://api.binance.com/api/v3/depth?symbol=XRPUSDT&limit=5000"
  	resp = Net::HTTP.get_response(URI.parse(url))
    data = JSON.parse(resp.body)
    data['bids'].each do |bid|
    	if bid[1].to_f > 100000
			@bid.store(bid[0].to_f.round(2), bid[1].to_f.round(2))
    	end
    end

    data['asks'].each do |ask|
	   	if ask[1].to_f > 100000
			@ask.store(ask[0].to_f.round(2), ask[1].to_f.round(2))
	    end
	end 

	url_price = "https://api.binance.com/api/v3/avgPrice?symbol=XRPUSDT"
	resp = Net::HTTP.get_response(URI.parse(url_price))
    @price = JSON.parse(resp.body)
    @price = @price['price'].to_f.round(3)
	#puts data['bids'][0][1] #-> amount of bid
  end

end
