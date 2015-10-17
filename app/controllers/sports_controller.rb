class SportsController < ApplicationController
  # GET /sports
  # GET /sports.json
  def index
    @items = Sport.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /sports/1
  # GET /sports/1.json
  def show
    @item = Sport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /sport/new
  # GET /sport/new.json
  def new
    @item = Sport.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /sports/1/edit
  def edit
    @item = Sport.find(params[:id])
  end

  # POST /sports
  # POST /sports.json
  def create
    @item = Sport.new(sport_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Sport was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sports/1
  # PUT /sports/1.json
  def update
    @item = Sport.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(sport_params)
        format.html { redirect_to @item, notice: 'Sport was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sports/1
  # DELETE /sports/1.json
  def destroy
    @item = Sport.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end

  private
  def sport_params
    params.require(:sport).permit(:name)
  end
end
