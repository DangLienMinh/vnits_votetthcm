class NewsController < ApplicationController
  # GET /news
  # GET /news.json
  def index
    @items = News.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /news/1
  # GET /news/1.json
  def show
    @item = News.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /news/new
  # GET /news/new.json
  def new
    @item = News.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /news/1/edit
  def edit
    @items = News.find(params[:id])
  end

  # POST /news
  # POST /news.json
  def create
    @item = News.new(news_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'News was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /news/1
  # PUT /news/1.json
  def update
    @item = News.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(news_params)
        format.html { redirect_to @item, notice: 'News was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @item = News.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end

  private
  def news_params
    params.require(:news).permit(:title,:publish,:desc,:summary,:user_id,:image)
  end
end
