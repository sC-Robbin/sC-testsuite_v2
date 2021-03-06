################################################################################
# Copyright 2016 spriteCloud B.V. All rights reserved.
# Generated by LapisLazuli, version 0.8.3
# Author: "barzilay" <barzilay@spritecloud.com>

Given(/^I am on a product lister page$/) do
  Nav.to('plp_page')
end

When(/^I select one of the items$/) do
  PLPage.products.first.click

end

Then(/^I am on the Product detail page of the selected item$/) do
  browser.url.include? "/itm/"
end

Then(/^I can see details of the product$/) do
  item = PDPage.productdetails

  raise("Cannot find details section on page") unless item && item.visible?

  #Lets embed a screenshot, even if the step succeeds.
  screenshot = browser.driver.screenshot_as(:base64)
  embed(screenshot, 'image/png;base64')
end