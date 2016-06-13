# You can require your activity files here.

class MarketPlaceActivity
	extend AWS::Flow::Activities

	activity :vendor_details, :approve_vendor, :reject_vendor, :onboard_vendor, :send_confirmation do
    {
      version: "1.0",
      default_task_priority: 10
    }
  	end

	def vendor_details(request_id)
		puts "to show a form where vendor can fill in his details"
		# his state should be ## Waiting for Approval
	end

	def approve_vendor(request_id)
		puts "approving a vendor with #{vendor_id}"
		# state "Approved"
	end

	def reject_vendor(request_id)
		puts "reject vendor with #{vendor_id}"
		# state "Rejected"
	end

	def onboard_vendor(request_id)
		puts "Onboarding the vendor"
		# state "Onboarded"
	end

	def send_confirmation(vendor_id)
		puts "Vendor confirmed Id: #{vendor_id}"
	end

end