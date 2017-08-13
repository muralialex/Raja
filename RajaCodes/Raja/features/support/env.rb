require 'selenium-webdriver'
require 'page-object'
require 'page-object/page_factory'
require 'cucumber'
require 'require_all'

World(PageObject::PageFactory)
require_all File.expand_path('../lib/', __FILE__)


ENV['BROWSER'] = "firefox" if ENV['BROWSER'].nil?

TEST_DATA_DIR = File.expand_path('../test_data', __FILE__)
#DataMagic.yml_directory = File.expand_path('../features/support/test_data', __FILE__)