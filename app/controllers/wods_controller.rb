class WodsController < ApplicationController
  before_action :set_wod, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @wods = Wod.all
  end

  def show
  end

  def new
    @wod = current_user.wods.build
  end

  def edit
  end
  
  def create
    @wod = current_user.wods.build(wod_params)
      if @wod.save
       redirect_to @wod, notice: 'Wod was successfully created.'
      else
        render action: 'new'
      end
  end

  def update
    
      if @wod.update(wod_params)
        redirect_to @wod, notice: 'Wod was successfully updated.'
      else
        render action: 'edit'
      end
  end
  
  def destroy
    @wod.destroy
    redirect_to wods_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wod
      @wod = Wod.find(params[:id])
    end


    def correct_user
      @wod = current_user.wods.find_by(id: params[:id])
      redirect_to wod_path, notice: "Not authorized to edit this Wod" if @wod.nil?
    end
    
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def wod_params
      params.require(:wod).permit(:description)
    end
end
