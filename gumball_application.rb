class Gumball
end

class GumballMachineModel

  def initialize(gumballCount: 0)
    # fill in this line
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
    # output a greeting message to the console
  end

  def menu
    choice = nil
    while choice != "G" && choice != "R" && choice != "X"
      puts "Press G to get a gumball, R to refill, or X to exit"
      choice = gets.chomp.upcase
    end

    choice
  end

  def getGumball
    puts "Yum, here's your gumball"
  end

  def machineEmpty
    # output an appropriate message to the console
  end

  def refill(count)
    # output an appropriate message to the console.
    # Make sure you tell the user how many gumballs there are now!
  end

  def exit
    # output an appropriate message to the console
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
          # fill in this line
        end
      end
      if choice == "R"
        numGumballs = @gumballMachineModel.refill(6)
        @gumballMachineView.refill( ) # put something inside the brackets
      end
      choice = @gumballMachineView.menu
    end
    # call the exit method
  end
end

gumballMachineController = GumballMachineController.new
gumballMachineController.run
