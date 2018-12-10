class DumpListToFile
  BASE_FOLDER = File.expand_path(Dir.pwd, "logs")

  private
  attr_reader :list

  public
  def initialize(list)
    @list = list
  end

  def call
    timestamp = DateTime.now.strftime('%Y%m%d%H%M%S')
    new_filename = "#{BASE_FOLDER}/logs/#{timestamp}.txt"

    File.open(new_filename, 'w') do |f|
      list.each do |node|
        line = "#{node.data.name} -> #{node.next_node.data.name}\n"
        f.write(line)
      end
    end
  end
end
