class ProducaosController < ApplicationController
  before_action :authenticate_user!, except: %i[]
  before_action :set_producao, only: %i[ show edit update destroy ]

  # GET /producaos or /producaos.json
  def index
    #@producaos = Producao.all
    #Paginação dos produtos
    
    current_page = (params[:page] || 1).to_i
    @producaos = Producao.page(current_page).per(3)
    
  end

  # GET /producaos/1 or /producaos/1.json
  def show
  end

  # GET /producaos/new
  def new
    @producao = Producao.new
  end

  # GET /producaos/1/edit
  def edit
  end

  # POST /producaos or /producaos.json
  def create
    @producao = Producao.new(producao_params)

    respond_to do |format|
      if @producao.save
        format.html { redirect_to producao_url(@producao), notice: "Produto Criado com sucesso" }
        format.json { render :index, status: :created, location: @producao }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @producao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /producaos/1 or /producaos/1.json
  def update
    respond_to do |format|
      if @producao.update(producao_params)
        format.html { redirect_to producao_url(@producao), notice: "Produto Atualizado com sucesso" }
        format.json { render :show, status: :ok, location: @producao }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @producao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /producaos/1 or /producaos/1.json
  def destroy
    @producao.destroy

    respond_to do |format|
      format.html { redirect_to producaos_url, notice: "Produto Excluido com sucesso" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_producao
      @producao = Producao.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def producao_params
      params.require(:producao).permit(:name, :description, :price)
    end
end
