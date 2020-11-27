class DumpListToFile
  BASE_FOLDER_PATH = File.expand_path(Dir.pwd)
  LOGS_FOLDER_PATH = File.join(BASE_FOLDER_PATH, "logs")

  private
  attr_reader :list

  public
  def initialize(list)
    @list = list
  end

  def call
    create_logs_folder
    write_list_to_file
  end

  private
  def create_logs_folder
    Dir.mkdir LOGS_FOLDER_PATH unless Dir.exist?(LOGS_FOLDER_PATH)
  end

  def write_list_to_file
    File.open(filename, 'w') do |f|
      list.each { |node| f.write(node.to_s) }
    end
  end

  def timestamp
    DateTime.now.strftime('%Y%m%d%H%M%S')
  end

  def filename
    "#{LOGS_FOLDER_PATH}/#{timestamp}.txt"
  end
end
