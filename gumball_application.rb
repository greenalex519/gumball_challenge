class Gumball
end

class GumballMachineModel

  def initialize(gumballCount: 0)
    @gumballCount
    puts "There are\ " && @gumballCount && "gumball/s in the Gumball Machine"
  end

  def dispense
    if @gumballCount > 0
      @gumballCount -= 1
      return Gumball.new
    else
      return nil
    end
  end

  def refill(count)
    @gumballCount += count
  end

end


class GumballMachineView

  def greeting
    puts "Welcome to the Gumball Machine"
    menuOptions = "Press G to get a gumball, R to refill, or X to exit"
    puts menuOptions
  end

  def menu
    choice = nil
    while choice != "G" && choice != "R" && choice != "X"
      puts menuOptions
      choice = gets.chomp.upcase
    end

    choice
  end

  def getGumball
    puts "Yum, here's your gumball"
  end

  def machineEmpty
    puts "There are no more gumballs :( Please refill before trying again."
  end

  def refill(count)
    puts "How many gumballs would you like to add?"
    refill = gets.chomp.to_i
    @gumballCount = @gumballCount + refill
    puts "There are now\ " && @gumballCount && "\ gumball/s in the machine."
    #add a else if
  end

  def exit
    puts "Thank you for your patronage, have a good day!"
  end

end
end

class GumballMachineController

  def initialize
    @gumballMachineModel = GumballMachineModel.new
    @gumballMachineView = GumballMachineView.new
  end

  def run
    @gumballMachineView.greeting
    choice = @gumballMachineView.menu

    while choice != "X"
      if choice == "G"
        gumball = @gumballMachineModel.dispense
        if gumball.nil?
          @gumballMachineView.machineEmpty
        else
          @gumballMachineView.get
        end
      end
      if choice == "R"
        numGumballs = @gumballMachineModel.refill(6)
        @gumballMachineView.refill(choice) # put something inside the brackets
      end
      choice = @gumballMachineView.menu
    end
    gumballMachineView.exit
  end
end

gumballMachineController = GumballMachineController.new
gumballMachineController.run
