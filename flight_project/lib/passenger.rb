class Passenger
    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def name
        @name
    end

    def has_flight?(str)
        if @flight_numbers.include?(str.upcase)
            return true
        end
        false
    end

    def add_flight(string)
        if !has_flight?(string)
            @flight_numbers << string.upcase
        end
    end



end