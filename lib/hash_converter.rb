require_relative 'dataloader'
class HashConverter
  attr_reader :file, :elf_hash
  def initialize
    @file = Dataloader.new
    @elf_hash = Hash.new { |h, k| h[k] = [] }
    self.hashify_data
  end

  def print_out
    p :file
  end

  def hashify_data
    elf_count = 1

    @file.file.each do |value|
      if value.to_i == 0
         elf_count+= 1
      else
        @elf_hash["elf_#{elf_count}"] << value.to_i
      end
    end
    @elf_hash
  end

  def cal_sum
    total_cal_hash = {}
    @elf_hash.each do |key, value|
      total_cal_hash[key] = value.sum
    end
    total_cal_hash.sort_by { |k, v| v }.reverse!
  end


end


new_file = HashConverter.new

# new_file.hashify_data
top_3 =  new_file.cal_sum.first(3)

total = 0
top_3.each do |k, v|
  total += v
end

puts total
