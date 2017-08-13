class TrainingCatalogPage
  include PageObject, TestDataLoader

  link(:learning, :xpath => "//button[span[text()='Learning']]")
  link(:trainingCatalog, :xpath => "//a[span[text()='Training Catalog']]")

  button(:tcCourseSearch, :class => "cckui-btn-icon cckui-btn-control cckui-btn-search")
  text_field(:tcCourseSearchTextbox, :id => "tc-search1")


  def navtoPage  parent,child
    send(parent)
    send(child)
    puts "Navigated successfully to : #{child} page"
  end

  def searchCourse courseTitle
    if tcCourseSearch?
      tcCourseSearch_element.click
      tcCourseSearchTextbox?
      tcCourseSearchTextbox_element.send_keys courseTitle
      tcCourseSearchTextbox_element.send_keys :enter
      waitForSpinnerToStopIfExists(5,30)
      if tcFilterSearchFirstCourse?
        if tcFilterSearchFirstCourse_element.text.include? courseTitle
          puts "Learner login Shared Learning shared course: #{courseTitle} verified successfully"
        else
          puts "Learner login Shared Learning shared course: #{courseTitle} verification failed"
        end
      end
    else
      puts "Unable to identify course search filed from Shared Learnings Page"
    end
  end

end
