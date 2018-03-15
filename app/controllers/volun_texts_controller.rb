class VolunTextsController < ApplicationController
  before_action :set_volun_text, only: [:show, :edit, :update, :destroy]

  access all: [:show], user: {except: [:new, :edit, :create, :update, :destroy]}, admin: :all

  # GET /volun_texts/1
  # GET /volun_texts/1.json
  def show
    @volun_texts = VolunText.all
  end

  # GET /volun_texts/new
  def new
    @volun_text = VolunText.new
  end

  # GET /volun_texts/1/edit
  def edit
  end

  # POST /volun_texts
  # POST /volun_texts.json
  def create
    @volun_text = VolunText.new(volun_text_params)

    respond_to do |format|
      if @volun_text.save
        format.html { redirect_to @volun_text, notice: 'Volun text was successfully created.' }
        format.json { render :show, status: :created, location: @volun_text }
      else
        format.html { render :new }
        format.json { render json: @volun_text.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /volun_texts/1
  # PATCH/PUT /volun_texts/1.json
  def update
    respond_to do |format|
      if @volun_text.update(volun_text_params)
        format.html { redirect_to @volun_text, notice: 'Volun text was successfully updated.' }
        format.json { render :show, status: :ok, location: @volun_text }
      else
        format.html { render :edit }
        format.json { render json: @volun_text.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /volun_texts/1
  # DELETE /volun_texts/1.json
  def destroy
    @volun_text.destroy
    respond_to do |format|
      format.html { redirect_to volun_texts_url, notice: 'Volun text was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_volun_text
      @volun_text = VolunText.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def volun_text_params
      params.require(:volun_text).permit(:title, :body)
    end
end
