class ItemsController < ApplicationController
  def index
    @list_of_items = Item.all
    render({ :template => "item_templates/list" })
  end

  def backdoor
    render({ :template => "item_templates/backdoor" })
  end

  def create
    @item = Item.new
    @item.link_url = params.fetch("query_link_url")
    @item.link_description = params.fetch("query_link_description")
    @item.thumbnail_url = params.fetch("query_thumbnail_url")

    @item.save
    redirect_to("/")
  end
end
