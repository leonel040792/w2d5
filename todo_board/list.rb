require "byebug"
require_relative "item.rb"
class List

    attr_accessor :label

    def initialize(label)
        @label = label
        @items=[]

    end

    def add_item(title, deadline, description="")

        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            return true
        end
        false

    end

    def size
        @items.length
    end

    def valid_index?(index)
        return false if 0> index || index >= self.size
        true
    end

    def swap(idx1, idx2)
        if self.valid_index?(idx1.to_i) && self.valid_index?(idx2.to_i)
            @items[idx1.to_i], @items[idx2.to_i]= @items[idx2.to_i], @items[idx1.to_i]
            return true 
        else
            return false
        end
    end

    def [](index)
        return @items[index] if valid_index?(index)
        nil
    end

    def priority
        @items[0]
    end

    def print
        puts @label
        puts "Index | Item | Deadline"
        puts "======================================="
        @items.each_with_index do |item,idx|

            puts "#{idx} | #{item.title.ljust(20," ")} | #{item.deadline.ljust(10," ")}"

        end
        puts "======================================="
    end

    def print_full_item(index)
        puts "===================="
        puts "#{@items[index.to_i].title}                #{@items[index].deadline}"
        puts "#{@items[index.to_i].description}"
        puts "===================="
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount=1)
        return false unless valid_index?(index)
        track=index
        if (index - amount) <0
            until @items[track]==@items[0]
                @items[track], @items[track-1]=@items[track-1],@items[track]
                track-=1
            end
        else
            amount.times do |i|
                @items[track], @items[track+1]=@items[track+1],@items[track]
                track-=1
            end        
        end
        true
    end

    def down(index, amount=1)
        return false unless valid_index?(index)
        track = index 

        if (index +amount) > (@items.length-1)
            until @items[track]==@items[-1]
                @items[track], @items[track+1]=@items[track+1],@items[track]
                track+=1
            end
        else
            amount.times do |i|
                @items[track], @items[track+1]=@items[track+1],@items[track]
                track+=1
            end
        end
        true
    end


    def sort_by_date!
        @items.sort_by!{|item| item.deadline}
    end

end