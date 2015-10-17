class AdminsController < ApplicationController
  before_filter :authenticate_user!
  def update_config
    main_setting = main_setting_params

    # banners id
    banners = main_setting[:sliders].split(",") if main_setting[:sliders]

    # links
    banners_links = params[:sliders_link].split(",") if  params[:sliders_link]

    # update attribute
    banners.each_with_index {|item, index| Upload.find(item).update_attributes({:link => banners_links[index]}) if index > 0} if banners

    if MainSetting.first
      @item = MainSetting.first
      @item.update_attributes(main_setting_params)
    else
      @item = MainSetting.new(main_setting_params)
      @item.save
    end
    
    flash[:msg] = I18n.t "update.success"
    
    respond_to do |format|
      format.html { redirect_to home_admin_path}
    end
  end

  def index
    @items = User.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /Users/new
  # GET /Users/new.json
  def new
    @item = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /Users/1/edit
  def edit
    @items = User.find(params[:id])
  end

  # POST /Users
  # POST /Users.json
  def create
    user_params[:is_admin] = true
    @item = User.new(user_params)

    respond_to do |format|
      if @item.save
        flash[:msg] = I18n.t "update.success"
        format.html { redirect_to home_admin_path}
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /Users/1
  # PUT /Users/1.json
  def update
    @item = User.find(params[:id])
    flash[:msg] = I18n.t "update.success"
    
    respond_to do |format|
      if @item.update_attributes(user_params)
        format.html { redirect_to home_admin_path, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Users/1
  # DELETE /Users/1.json
  def destroy
    @item = User.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to home_admin_path }
      format.json { head :no_content }
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :phone, :user_name, :address, :is_admin)
  end
  def main_setting_params
    params.require(:main_setting).permit(:pro_content, :pro_title, :sliders, :introduce,:term,:start_time,:end_time)
  end
end
