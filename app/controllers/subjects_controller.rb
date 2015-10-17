class SubjectsController < ApplicationController
  # GET /subjects
  # GET /subjects.json
  def index
    @items = Subject.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    @item = Subject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /subjects/new
  # GET /subjects/new.json
  def new
    @item = Subject.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /subjects/1/edit
  def edit
    @item = Subject.find(params[:id])
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @item = Subject.new(group_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Subject was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subjects/1
  # PUT /subjects/1.json
  def update
    @item = Subject.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(group_params)
        format.html { redirect_to @item, notice: 'Subject was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @item = Subject.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end

  private
  def subject_params
    params.require(:subject).permit(:name,:detail,:pics,:group_id,:sport_id)
  end
end
