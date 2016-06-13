require 'aws/decider'

input = {
  request_id: "1234567890",
  vendor_id: "1234567890",
  vendor_details: true,
  approve_vendor: false,
  reject_vendor: false,
  onboard_vendor: false
}

opts = {
  domain: "MarketPlace",
  version: "1.0"
}

AWS::Flow::start_workflow("MarketPlaceWorkflow.create_vendor", input, opts)