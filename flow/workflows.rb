# You can require your workflow files here.

require 'flow/activities'

class MarketPlaceWorkflow
extend AWS::Flow::Workflows


  workflow :create_vendor do
    {
      version: "1.0",
      default_execution_start_to_close_timeout: 120,
      default_task_priority: 10
    }
  end

  activity_client(:client) { { from_class: "MarketPlaceActivity" } }


  def create_vendor(options)
  	puts "Workflow has started\n" unless is_replaying?
    # This array will hold all futures that are created when asynchronous
    # activities are scheduled
    futures = []
    if options[:vendor_details]
    	puts "Gettting Vendor Details" unless is_replaying?
    	futures << client.send_async(:vendor_details, options[:request_id])
    end

    if options[:approve_vendor]
    	puts "Approving vendor" unless is_replaying?
    	futures << client.send_async(:approve_vendor, options[:request_id])
    end

    if options[:reject_vendor]
    	puts "Rejecting vendor" unless is_replaying?
    	futures << client.send_async(:reject_vendor, options[:request_id])
    end

    if options[:onboard_vendor]
    	puts "Onboarding vendor" unless is_replaying?
    	futures << client.send_async(:onboard_vendor, options[:request_id])
    end

    # After waiting on the reservation activities to complete, the workflow
    # will call the send_confirmation activity.
    client.send_confirmation(options[:vendor_id])

    puts "Workflow has completed\n" unless is_replaying?
  end

  def is_replaying?
    decision_context.workflow_clock.replaying
  end

end