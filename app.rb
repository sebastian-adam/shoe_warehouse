require('bundler/setup')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @brands = Brand.all().order('name ASC')
  @stores = Store.all().order('name ASC')
  erb(:index)
end

get('/stores/:id') do
  @store = Store.find(params['id'])
  @brands = Brand.all.order('name ASC')
  @unused_brands = @brands - @store.brands
  erb(:recipe)
end

get('/stores/:id/edit') do
  @store = Store.find(params['id'])
  @brands = Brand.all.order('name ASC')
  @tags = Tag.all
  erb(:recipe_form)
end

get('/stores/:id/stores/edit') do
  @store = Store.find(params['id'])
  erb(:store_edit)
end

get('/stores/:id/brands/edit') do
  @store = Store.find(params['id'])
  @brands = Brand.all
  @unused_brands = @brands - @store.brands
  erb(:brand_edit)
end

post('/stores/new') do
  @store = Store.create(name: params['name_store'], location: params['location'], phone: params['phone'], open_time: params['open_time'], close_time: params['close_time']);
  redirect "recipes/#{@recipe.id()}"
end

patch('/stores/:id') do
  @store = Store.find(params['id'])
  @store.update(name: params['store_name'], location: params['location'], phone: params['phone'], open_time: params['open_time'], close_time: params['close_time'])
  redirect "stores/#{@store.id()}/stores/edit"
end

delete ('/stores/:id/delete') do
  @store = Store.find(params['id']).destroy()
  redirect "/"
end

post('/brands/new') do
  @store = Store.find(params['store_id'])
  if Brand.find_by_name(params['brand_name'])
    brand = Brand.find_by_name(params['brand_name'])
  else
    brand = Brand.create(name: params['tag_name'])
  end
  @Store.brands.push(brand)
  redirect "stores/#{params['store_id']}/brands/edit"
end

patch('/stores/:store_id/brands/:id') do
  @brand = Brand.find(params['id'])
  @brand.update(store_ids: nil)
  redirect "/stores/#{params['store_id']}/brands/edit"
end
