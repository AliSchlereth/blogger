require "rails_helper"

describe "user creates a new article" do
  describe "they link from the articles index" do
    describe "they fill in a title and body" do
      it "creates a new article" do
        visit articles_path
        click_link "Create a New Article"

        expect(current_path).to eq(new_article_path)

        fill_in "article[title]", with: "New Title!"
        fill_in "article[body]",  with: "New Body!"
        fill_in "article[tag_list]", with: "ruby, technology"
        click_on "Create Article"

        expect(page).to have_content("New Title!")
        expect(page).to have_content("New Body!")
        expect(page).to have_content("Article New Title! Created!")
        expect(page).to have_content("ruby technology")
      end
    end
  end
end

=begin
  I thought maybe I had done something wrong since the spec shows
  Run your tests again. I got this error:

Failures:

  1) user creates a new article they link from the articles index they fill in a title and body creates a new article
     Failure/Error: expect(page).to have_content("ruby, technology") <-- this line here
       expected to find text "ruby, technology" in "Article New Title! Created! New Title! New Body! Edit Delete Comments (0) Post a Comment Your Name Your Comment << Back to Articles List"

       so I kept pouring over my methods and double checking if I had a typo or something. In your actual repo as shown you've removed the comma in the test, which would pass. I've spent a bunch of time messing with
       things trying to comma seperate the links. Its actually quite tedious! Maybe remove the comma from that line in the spec just so others don't get that error.
       If I find an elegant solution to comma seperate, I'll send it. I've been looking into making helper methods and such but might just move on!
=end
