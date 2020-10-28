class CurrenciesController < ApplicationController
    def first_currency
      @raw_data = open("https://api.exchangerate.host/symbols").read
      @parsed_data = JSON.parse(@raw_data)
      @symbols_hash = @parsed_data.fetch("symbols")
      @array_of_symbols = @symbols_hash.keys

   
      render({ :template => "currency_templates/step_one.html.erb"})
    end

    def flex_currency
      @from_symbol = params.fetch("from_currency")


      @raw_data = open("https://api.exchangerate.host/symbols").read
      @parsed_data = JSON.parse(@raw_data)
      @symbols_hash = @parsed_data.fetch("symbols")
      @array_of_symbols = @symbols_hash.keys


        render({ :template => "currency_templates/flex_output.html.erb"})
    end

    def exchange_rate
      @from_symbol = params.fetch("from_currency")
      @to_symbol = params.fetch("to_currency")
      
      @raw_data = open("https://api.exchangerate.host/convert?from=#{@from_symbol}&to=#{@to_symbol}").read
      @parsed_data = JSON.parse(@raw_data)
      @keys = @parsed_data.keys

      
        render({ :template => "currency_templates/exchange_rate.html.erb"})
    end

  end