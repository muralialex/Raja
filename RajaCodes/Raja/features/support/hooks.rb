Before do |scenario|
    @browser = Watir::Browser.new ENV['BROWSER'].to_sym
end

After do |scenario|
  begin
    if scenario.failed?
      Dir::mkdir('results/screenshots') if not File.directory?('results/screenshots')
      screenshot = "./results/screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
      @browser.driver.save_screenshot(screenshot)
      embed screenshot, 'image/png'
    end
  ensure
    @browser.driver.quit
  end
end

