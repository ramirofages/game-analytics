class CheckpointsController < ApplicationController
  before_action :set_checkpoint, only: [:show, :edit, :update, :destroy]

  # GET /checkpoints
  # GET /checkpoints.json
  def index
    @level = Level.find(params[:level_id])
    
  end

  # GET /checkpoints/1
  # GET /checkpoints/1.json
  def show
  end

  # GET /checkpoints/new
  def new
    @checkpoint = Checkpoint.new
  end

  # GET /checkpoints/1/edit
  def edit
  end

  # POST /checkpoints
  # POST /checkpoints.json
  def create
    @checkpoint = Checkpoint.new(checkpoint_params)
    @checkpoint.activationCount = 0
    
    respond_to do |format|
      if @checkpoint.save
        format.html { redirect_to level_checkpoint_path(@checkpoint.level,@checkpoint) , notice: 'Checkpoint was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /checkpoints/1
  # PATCH/PUT /checkpoints/1.json
  def update
    respond_to do |format|
      if @checkpoint.update(checkpoint_params)
        format.html { redirect_to level_checkpoints_path(@checkpoint.level), notice: 'Checkpoint was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /checkpoints/1
  # DELETE /checkpoints/1.json
  def destroy
    @level = @checkpoint.level
    @checkpoint.destroy
    respond_to do |format|
      format.html { redirect_to level_checkpoints_path(@level, @level.checkpoints), notice: 'Checkpoint was successfully destroyed.' }
    end
  end

  def triggered
      @checkpoint = Level.find(params[:level_id]).checkpoints.find { |check| check.number == params.require(:id).to_i }
     
      if @checkpoint.update(activationCount: @checkpoint.activationCount + 1)
          render text:"ok", status: :ok
        else
          render text:"error", status: :unprocessable_entity
          
        end  
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkpoint
      #@checkpoint = Checkpoint.find(params[:id])
      @checkpoint = Level.find(params[:level_id]).checkpoints.find(params[:id]) 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def checkpoint_params
      params.require(:checkpoint).permit(:number, :level_id, :activationCount)
    end
end
