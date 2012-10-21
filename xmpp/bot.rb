#encoding: utf-8
require 'rubygems'
require 'blather/client'
require 'httparty'



setup 'nobody@fulmen', '123'

subscription :request? do |s|
  write_to_stream s.approve!
end

# Echo back what was said
message :chat?, :body => /previsão.*sorocaba/i do |m|
  say m.from, Weather.get(544)
end

message :chat?, :body => /previsão.*são paulo/i do |m|
  say m.from, Weather.get(558)
end

message :chat?, :body => /previsão.*campinas/i do |m|
  say m.from, Weather.get(418)
end


module Weather
	WEATHER_URL = 'http://selos.climatempo.com.br/selos/selo.php?CODCIDADE='

	def self.get(city_code)
		response = HTTParty.get("WEATHER_URL#{city_code})
	end
end