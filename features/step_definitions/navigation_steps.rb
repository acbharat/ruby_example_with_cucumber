Given(/^I am on dubizzle (dubai|egypt) home page$/) do |local|
  @homepage=HomePage.new(driver).go_to(local)
  expect {@homepage.is_current_page?(local)}.to be_true
end
When(/^I check for content$/) do
#  Do nothing
end
Then(/^I the title of home page should be (dubizzle Dubai Classifieds$|dubizzle Egypt Classifieds$)/) do  |title|
  page_title = @homepage.get_page_title
  expect(page_title).to include(title)
end
Then(/^I should see (place an ad option|search form|quick links)$/) do |links|
  page_links = links.gsub!(' ','_')
  expect {(@homepage.is_link_present?(page_links))}.to be_true
end