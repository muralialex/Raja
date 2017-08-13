module CommonMethods
  include PageObject

  def waitForSpinnerToStopIfExists(appearTimeOut = 10, disappearTimeOut = 120)
    begin
      self.wait_until(appearTimeOut, "Spinner did not load within #{appearTimeOut} seconds") do
        self.spinnerIcon?
      end
      spinnerIcon_element.when_visible(appearTimeOut)
      waitForAllAjaxRequestsToFinish
      spinnerIcon_element.when_not_visible(disappearTimeOut)
      puts "Spinner element identified in #{appearTimeOut} sec"
    rescue Exception
      puts "Spinner element not visible in #{appearTimeOut} sec"
    end
  end


  def waitForAllAjaxRequestsToFinish(requestTimeOut = 30)
    begin
      pendingRequests = execute_script(::PageObject::JavascriptFrameworkFacade.pending_requests)
#puts "Pending requests:"+pendingRequests.to_s
      if(pendingRequests>0)
        wait_for_ajax(requestTimeOut,"Wait for ajax request to finish")
      end
      sleep 3
      morePendingRequests = execute_script(::PageObject::JavascriptFrameworkFacade.pending_requests)
#puts "More Pending requests:"+morePendingRequests.to_s
      iterate = 1
      until(morePendingRequests==0)
        puts "Awaiting for new pending requests to finish:"+iterate.to_s
        wait_for_ajax(30,"Wait for ajax request to finish")
        sleep 3
        morePendingRequests = execute_script(::PageObject::JavascriptFrameworkFacade.pending_requests)
        iterate = iterate+1
      end
      if block_given?
        yield
      end
    rescue Exception
      puts "Exceptions on ajax requests to finish"
      puts( $!.class )
      puts( $! )
    end
  end
end