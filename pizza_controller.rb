require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative("./models/pizza_order.rb")

# index from db
get "/pizza-orders" do
  @orders = PizzaOrder.all()
erb(:index)
end

# new order
get "/pizza-orders/new" do
  erb(:new)
end


# show individual order from db
get "/pizza-orders/:id" do
  @order = PizzaOrder.find( params[:id] )
  erb(:show)
end


# create in db
post "/pizza-orders" do
  order = PizzaOrder.new(params)
  order.save()
  redirect to "/pizza-orders"
end

# edit order form
get "/pizza-orders/:id/edit" do
  @order = PizzaOrder.find(params[:id])


  erb(:edit)

end

# update db
post "/pizza-orders/:id" do
  
  @order = PizzaOrder.new(params)
  @order.update()
  # erb(:edit)
  redirect to "/pizza-orders"

end

# destory order
 post "/pizza-orders/:id/delete" do
  @order = PizzaOrder.find(params[:id])

  @order.delete()
  redirect to "/pizza-orders/new"
end
