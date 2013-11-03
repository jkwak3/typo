# Add a declarative step here for populating the DB with movies.

Given /the following comments exist/ do |comments_table|
  comments_table.hashes.each do |comment|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
	Comment.create(comment)
  end
  #flunk "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  assert page.body =~ /#{e1}.*#{e2}/m, "ERROR"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split(", ").each do |rating|
    if uncheck
      uncheck("ratings_#{rating}")
    else
      check("ratings_#{rating}")
    end
  end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  rows = page.all("#movies tr").size - 1
  value = Movie.count
  assert rows.should == value
end

Then /the director of "(.*)" should be "(.*)"/ do |title, director|
  assert Movie.find_by_title(title).director == director
end
