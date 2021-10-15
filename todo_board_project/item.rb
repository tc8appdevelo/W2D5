class Item

    def self.valid_date?(date_string)
        date_array = date_string.split("-")
        nums = [0,1,2,3,4,5,6,7,8,9]

        if date_array.length != 3
            return false
        end
        date_array.join("").each_char do |ele|
            if !nums.include?(ele.to_i)
                return false
            end
        end

        yyyy = date_array[0]
        mm = date_array[1]
        dd = date_array[2]

        if yyyy.length != 4
            return false
        end

        if mm.to_i > 12 || mm.to_i < 1
            return false
        elsif mm.length != 2
            return false
        end

        if dd.to_i > 31 || dd.to_i < 1
            return false
        elsif dd.length != 2
            return false
        end

        true
    end

    attr_accessor :title, :description

    def initialize(title, deadline, description)
        if !Item.valid_date?(deadline)
            raise "deadline is not valid"
        end
        @title = title
        @deadline = deadline
        @description = description
    end

    def deadline
        @deadline
    end

    def deadline=(new_deadline)
        if !Item.valid_date?(new_deadline)
            raise "deadline is not valid"
        end
        @deadline = new_deadline
    end
end


# p Item.valid_date?('2019-10-25') # true
# p Item.valid_date?('1912-06-23') # true
# p Item.valid_date?('2018-13-20') # false
# p Item.valid_date?('2018-12-32') # false
# p Item.valid_date?('10-25-2019') # false