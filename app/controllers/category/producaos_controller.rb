class Category::ProducaosController < ApplicationController
    before_action :set_category

    def index
      @producaos = @category.producaos
    end
  
    def show
    end
  
    def new
      @producao = @category.producaos.new
    end
  
    def edit
    end
    # POST /categories or /categories.json
    def create
        @producao = Producao.new(producao_params)
        # abort producao_params.inspect
  
      respond_to do |format|
        if @producao.save
          format.html { redirect_to category_producaos_path(@category), notice: "Producao was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /categories/1 or /categories/1.json
    def update
      respond_to do |format|
        if @category.update(category_params)
          format.html { redirect_to category_url(@category), notice: "Category was successfully updated." }
          format.json { render :show, status: :ok, location: @category }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /categories/1 or /categories/1.json
    def destroy
      @category.destroy
  
      respond_to do |format|
        format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

    def set_category
        @category = Category.find(params[:category_id])
    end

    def producao_params
      params.require(:producao).permit(:name, :description, :price, :category_id)
    end
end
