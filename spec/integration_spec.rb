require 'spec_helper'

describe 'home route', type: :feature do
  it 'should list out stores' do
    footlocker = Store.create(name: 'Foot Locker', location: '9459 SW Washington St, Tigard, OR 97223', phone: '503-684-2053', open_time: '9', close_time: '8');
    champs = Store.create(name: 'Champs', location: '12000 SE 82nd Ave, Happy Valley, OR 97086', phone: '503-772-9012', open_time: '7', close_time: '10');
    visit('/')
    expect(page).to have_content('Foot Locker')
    expect(page).to have_content('Champs')
  end

  it 'should list out brands' do
    visit('/')
    expect(page).to have_no_css('img')
    nike = Brand.create(name: 'Nike', image: 'http://www.screenitltd.com/sites/default/files/brands/nike-logo.png')
    timberland = Brand.create(name: 'Timberland', image: 'http://images.theexecutiveadvertising.com/images/manflogo/timberland.png')
    visit('/')
    expect(page).to have_xpath("//img[@src=\"#{nike.image}\"]")
  end

  it 'should save each store and brand name with capital first letters' do
    footlocker = Store.create(name: 'foot locker', location: '9459 SW Washington St, Tigard, OR 97223', phone: '503-684-2053', open_time: '9', close_time: '8');
    visit('/')
    expect(page).to have_content('Foot Locker')
  end

  it 'should not save a store or brand if the input name is an empty string' do
    footlocker = Store.create(name: '', location: '9459 SW Washington St, Tigard, OR 97223', phone: '503-684-2053', open_time: '9', close_time: '8');
    visit('/')
    expect(page).to have_no_content('9459 SW Washington St, Tigard, OR 97223')
  end

  it 'should route to "stores/new"' do
    visit('/')
    click_button('Add Store')
    expect(page).to have_content('New Store Profile')
  end

  it 'should add store on submit' do
    visit("/stores/new")
    fill_in('name', with: "Champs")
    fill_in('location', with: "9459 SW Washington St, Tigard, OR 97223")
    fill_in('phone', with: '503-684-2053')
    fill_in('open_time', with: '10')
    fill_in('close_time', with: '8')
    click_button('ADD STORE')
    expect(page).to have_content("9459 SW Washington St, Tigard, OR 97223")
  end

  it 'should route to "stores/:id/edit"' do
    footlocker = Store.create(name: 'Foot Locker', location: '9459 SW Washington St, Tigard, OR 97223', phone: '503-684-2053', open_time: '9', close_time: '8');
    visit("/stores/#{footlocker.id()}/edit")
    expect(page).to have_content('Edit Store Profile')
  end

  it 'should edit store on submit' do
    footlocker = Store.create(name: 'Foot Locker', location: '9459 SW Washington St, Tigard, OR 97223', phone: '503-684-2053', open_time: '9', close_time: '8');
    visit("/stores/#{footlocker.id()}/edit")
    fill_in('name', with: "Champs")
    fill_in('location', with: "12000 SE 82nd Ave, Happy Valley, OR 97086")
    fill_in('phone', with: '503-684-2053')
    fill_in('open_time', with: '10')
    fill_in('close_time', with: '8')
    click_button('SAVE CHANGES')
    visit('/')
    expect(page).to have_content("12000 SE 82nd Ave, Happy Valley, OR 97086")
  end

  it 'should add brand on submit' do
    visit('/brands/new')
    fill_in('brand_name_input', with: "Reebock")
    fill_in('image', with: "http://www.screenitltd.com/sites/default/files/brands/nike-logo.png")
    click_on("Add Brand")
    visit('/')
    reebock = Brand.find_by name: "Reebock"
    expect(page).to have_xpath("//img[@src=\"#{reebock.image}\"]")
  end

end
