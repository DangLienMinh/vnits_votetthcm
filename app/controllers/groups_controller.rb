class GroupsController < ApplicationController
  # GET /groups
  # GET /groups.json
  def index
    @items = Group.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @item = Group.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /groups/new
  # GET /groups/new.json
  def new
    @item = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /groups/1/edit
  def edit
    @item = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.json
  def create
    @item = Group.new(group_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Group was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    @item = Group.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(group_params)
        format.html { redirect_to @item, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @item = Group.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end
