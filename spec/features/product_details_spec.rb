require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can access the product page details" do
    # ACT
    visit root_path
    first('article.product').find('.btn-default').click()


  #   VERIFY
    expect(page).to have_css 'article.product-detail'
    page.save_screenshot()
  end
end
