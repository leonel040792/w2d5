require "byebug"

class Item

    def self.valid_date?(date)
        date_arr=date.split("-")
        return false if !date_arr.map!(&:to_i)
        return false if date_arr.length!=3
        return false if date_arr[0]<1000 || date_arr[1]>9999
        return false if date_arr[1]<0 || date_arr[1]>12
        return false if date_arr[2]<0 || date_arr[2]>31
        true
    end

    #Instance Methods
    attr_accessor :title, :description
    attr_reader :deadline

    def initialize(title, deadline, description)
        @title=title
        @description = description
        # Item.valid_date?(deadline) ? @deadline= deadline : (raise "Wrong formatting. Please use 'YYYY-MM-DD' ")
        self.deadline=(deadline)
    end

    def deadline=(new_deadline)
        Item.valid_date?(new_deadline) ? @deadline= new_deadline : (raise "Wrong formatting. Please use 'YYYY-MM-DD' ")
    end

    



end