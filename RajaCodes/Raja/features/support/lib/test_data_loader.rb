module TestDataLoader
  #:ToDO: Avoid Loading YAML Multiple Times
  #test_data = settings = File.file?("#{TEST_DATA_DIR}/test_data.yml") ? YAML.load_file("#{TEST_DATA_DIR}/test_data.yml") : {}
def TestDataLoader.get_url route
    YAML.load_file("#{TEST_DATA_DIR}/test_data.yml")["urls"][route]
  end

  def TestDataLoader.get_title page
    YAML.load_file("#{TEST_DATA_DIR}/test_data.yml")["titles"][page]
  end


end