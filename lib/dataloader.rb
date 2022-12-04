
class Dataloader
  attr_reader :file
  def initialize
    @file = File.readlines('data/data.txt')

  end

end

# new_file = Dataloader.new

# p new_file
