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

patch('/stores/:id') do
  @store = Store.find(params['id'])
  @store.update(name: params['name_store'], location: params['location'], phone: params['phone'], open_time: params['open_time'], close_time: params['close_time'])
  redirect "stores/#{@store.id()}/edit"
end

post('/stores/new') do
  @store = Store.create(name: params['name_store'], location: params['location'], phone: params['phone'], open_time: params['open_time'], close_time: params['close_time']);
  redirect "recipes/#{@recipe.id()}"
end

delete ('/stores/:id/delete') do
  @store = Store.find(params['id']).destroy()
  redirect "/"
end
