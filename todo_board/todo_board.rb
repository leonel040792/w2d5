require "byebug"
require_relative "list.rb"

class TodoBoard

    def initialize(label)
        @list=List.new(label)
    end

    def get_command
        puts "You have many options with this list: mktodo, up, down, swap, sort, priority, print and quit!"
        puts "Enter a command:"
        cm, *args = gets.chomp.split(" ")

        case cm
        when 'mktodo'
            @list.add_item(*args)
            # return true
        when 'up'
            @list.up(*args.each(&:to_i))
            # return true
        when 'down'
            @list.down(*args.each(&:to_i))
            # return true
        when 'swap'
            @list.swap(args[0],args[1])
            # return true
        when 'sort'
            @list.sort_by_date!(*args.each(&:to_i))
            # return true
        when 'priority'
            @list.print_priority
            # return true
        when 'print'
            if args.length==0
                @list.print 
            else 
                @list.print_full_item(*args.each(&:to_i))
            end
            # return true
        when 'quit'
            return false
        else
            puts "Sorry, that command was not an option. Why are you like this?"
        end
        true
    end


    def run 
        self.get_command while get_command
    end



end