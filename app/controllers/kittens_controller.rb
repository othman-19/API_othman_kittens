class KittensController < ApplicationController
  before_action :set_kitten, only: %i[show edit update destroy]

  def index
    @kittens = Kitten.all
  end

  def show; end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    respond_to do |format|
      if @kitten.save
        format.html { redirect_to :root, notice: 'Kitten was successfully created.' }
        format.json { render :show, status: :created, location: @kitten }
      else
        format.html { redirect_to :root, alert: 'Kitten not created' }
        format.json { render json: @kitten.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @kitten.update(kitten_params)
        format.html { redirect_to @kitten, notice: 'Kitten was successfully updated.' }
        format.json { render :show, status: :ok, location: @kitten }
      else
        format.html { render :edit }
        format.json { render json: @kittn.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @kitten.destroy
    respond_to do |format|
      format.html { redirect_to :root, notice: 'Kitten was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end

private
  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
  def set_kitten
    @kitten = Kitten.find(params[:id])
  end
